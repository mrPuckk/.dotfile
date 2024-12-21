local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_font = function(fonts)
	local random_picking_font = h.get_random_entry(fonts)
	return wezterm.font_with_fallback({
		{ family = random_picking_font, weight = "Bold" },
		{ family = "Symbols Nerd Font Mono" },
	})
end

return M
