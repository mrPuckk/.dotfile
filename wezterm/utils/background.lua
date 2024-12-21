local M = {}
local h = require("utils/helpers")

M.get_background = function()
	return {
		source = {
			Gradient = {
				colors = {"#1e2030"},
			},
		},
		width = "100%",
		height = "100%",
		opacity = 0.95,
	}
end

return M
