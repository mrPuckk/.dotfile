#!/usr/bin/env bash

get_fzf_options() {
	local fzf_options
	local fzf_default_options='-d 35% -m -0 --no-preview --no-border'
	fzf_options="$(tmux show -gqv '@fzf-url-fzf-options')"
	[ -n "$fzf_options" ] && echo "$fzf_options" || echo "$fzf_default_options"
}

fzf_filter() {
	eval "fzf-tmux $(get_fzf_options)"
}

open_url() {
	if hash xdg-open &>/dev/null; then
		nohup xdg-open "$@"
	elif hash open &>/dev/null; then
		nohup open "$@"
	elif [[ -n $BROWSER ]]; then
		nohup "$BROWSER" "$@"
	fi
}

limit='screen'
[[ $# -ge 2 ]] && limit=$2

if [[ $limit == 'screen' ]]; then
	content="$(tmux capture-pane -J -p)"
else
	content="$(tmux capture-pane -J -p -S -"$limit")"
fi

urls=$(echo "$content" | grep -oE '(https?|ftp|file):/?//[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]')
wwws=$(echo "$content" | grep -oE '(http?s://)?www\.[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}(/\S+)*' | grep -vE '^https?://' | sed 's/^\(.*\)$/http:\/\/\1/')
ips=$(echo "$content" | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{1,5})?(/\S+)*' | sed 's/^\(.*\)$/http:\/\/\1/')
gits=$(echo "$content" | grep -oE '(ssh://)?git@\S*' | sed 's/:/\//g' | sed 's/^\(ssh\/\/\/\)\{0,1\}git@\(.*\)$/https:\/\/\2/')
gh=$(echo "$content" | grep -oE "['\"]([A-Za-z0-9-]*/[.A-Za-z0-9-]*)['\"]" | sed "s/['\"]//g" | sed 's#.#https://github.com/&#')
npm=$(echo "$content" | grep -oE 'import\s+[^"'\'';]*['\''"]([^.][^"'\'';]*)['\''"];' | sed 's/[^"'\''"]*"\([^"'\''"]*\)";/\1/' | sed 's@.@https:\/\/npmjs.com\/package\/&@')

if [[ $# -ge 1 && "$1" != '' ]]; then
	extras=$(echo "$content" | eval "$1")
fi

items=$(
	printf '%s\n' "${urls[@]}" "${wwws[@]}" "${gh[@]}" "${npm[@]}" "${ips[@]}" "${gits[@]}" "${extras[@]}" |
		grep -v '^$' |
		sort -u |
		nl -w3 -s '  '
)
[ -z "$items" ] && tmux display 'tmux-fzf-url: no URLs found' && exit

fzf_filter <<<"$items" | awk '{print $2}' |
	while read -r chosen; do
		open_url "$chosen" &>"/tmp/tmux-$(id -u)-fzf-url.log"
	done
