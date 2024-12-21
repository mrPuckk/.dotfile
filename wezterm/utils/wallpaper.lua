local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_wallpaper = function(name)
	return {
		source = { File = { path = os.getenv("HOME") .. "/.config/wezterm/wallpapers/nvim/" .. name } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

M.set_nvim_wallpaper = function(name)
	return {
		source = { File = { path = os.getenv("HOME") .. "/.config/wezterm/wallpapers/nvim/" .. name } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

M.set_tmux_session_wallpaper = function(value)
	local path = os.getenv("HOME") .. "/.config/wezterm/wallpapers/sessions/" .. value .. ".jpeg"
	print(path)
	return {
		source = { File = { path = path } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
		-- speed = 200,
	}
end

return M
