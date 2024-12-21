-- A simple statusline/winbar component that uses LSP to show your current code context.
-- Named after the Indian satellite navigation system.
-- https://github.com/SmiteshP/nvim-navic

local M = {
    "SmiteshP/nvim-navic",
}

function M.config()
    local icons = require "user.icons"
    require("nvim-navic").setup {
        icons = icons.kind,
        highlight = true,
        lsp = {
            auto_attach = true,
        },
        click = true,
        separator = " " .. icons.ui.ChevronRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
    }
end

return M
