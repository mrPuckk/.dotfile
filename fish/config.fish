# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com/
# https://github.com/joshmedeski/dotfiles/blob/main/.config/fish/config.fish

# >>> setting >>>
set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

set -gx COLORTERM truecolor
set -Ux EDITOR nvim 

set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes

# ~/.config/fish/config.fish
set -Ux FZF_TMUX_OPTS "-p 55%,60%"
# <<< setting <<<

# >>> set paths >>>
set -Ux OPENAI_API_KEY "sk-proj-N1oNMceGZVaCWiZ8uF1LT3BlbkFJGVPuUAZeWQpMRP16eBAd"

set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx GOPATH "/Users/quangtuongphung/myDev/Go_DesignPattern"
set -gx CONFIG_DIR "/Users/quangtuongphung/.config/sketchybar"

set -x VULKAN_SDK /Users/quangtuongphung/VulkanSDK/1.3.275.0/macOS
set -x PATH $VULKAN_SDK/bin $PATH
set -x DYLD_LIBRARY_PATH $VULKAN_SDK/lib $DYLD_LIBRARY_PATH
set -x VK_ICD_FILENAMES $VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
set -x VK_LAYER_PATH $VULKAN_SDK/share/vulkan/explicit_layer.d
# <<< set paths <<<

# >>> abbreviation >>>
# https://fishshell.com/docs/current/cmds/abbr.html
# abbr bi "brew install"
abbr gt "nvim +GoToFile"

# alias 
# Temp workaround to disable punycode deprecation logging to stderr
# https://github.com/bitwarden/clients/issues/6689
alias bw='NODE_OPTIONS="--no-deprecation" bw'

# alias nvim lvim
# alias ls "ls -p -G -al"
# alias la "ls -A"
# alias lla "ll -A"

alias cl "clear"
alias qq "exit"
# exa shortcut
if type -q eza 
	alias ll "eza -al -g --icons"
  alias ls "ll"
	alias lla "ll -a"
end 
# <<< abbreviation <<<

# >>> Start Up >>>
zoxide init fish | source
starship init fish | source

# >>> Add to $PATH >>>
# TODO: how to manage the $PATH in smart way 
fish_add_path /opt/homebrew/bin # https://brew.sh/
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path /Users/quangtuongphung/.config/scripts

fish_add_path /Users/quangtuongphung/mambaforge/bin
fish_add_path /Users/quangtuongphung/.local/bin
fish_add_path /Users/quangtuongphung/.config/tmux/plugins/t-smart-tmux-session-manager/bin  
fish_add_path /Users/quangtuongphung/.tmux/plugins/t-smart-tmux-session-manager/bin  
fish_add_path /Applications/Visual Studio Code.app/Contents/Resources/app/bin

fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /usr/local/go/bin

fish_add_path /Applications/Julia-1.9.app/Contents/Resources/julia/bin/julia
fish_add_path ~/.config/bin
# <<< Start Up <<<

eval (/opt/homebrew/bin/brew shellenv)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/quangtuongphung/mambaforge/bin/conda
    eval /Users/quangtuongphung/mambaforge/bin/conda "shell.fish" "hook" $argv | source
end

if test -f "/Users/quangtuongphung/mambaforge/etc/fish/conf.d/mamba.fish"
    source "/Users/quangtuongphung/mambaforge/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

