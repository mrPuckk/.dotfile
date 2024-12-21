local M = {
    "renerocksai/telekasten.nvim",
    -- dependencies = { "nvim-telescope/telescope.nvim" },
}

function M.config()
    require("telekasten").setup {

        -- Main paths
        home = vim.fn.expand "~/zettelkasten", -- Put the name of your notes directory here
        dailies = vim.fn.expand "~/zettelkasten/daily/", -- path to daily notes
        weeklies = vim.fn.expand "~/zettelkasten/weeklies/", -- path to weekly notes
        templates = vim.fn.expand "~/zettelkasten/templates/", -- path to templates

        -- Specific note templates
        -- template_new_note = "/path/to/file", -- template for new notes
        template_new_daily = vim.fn.expand "~/zettelkasten/templates/daily.md", -- template for new daily notes
        -- template_new_weekly = "/path/to/file", -- template for new weekly notes

        -- Image subdir for pasting
        -- subdir name
        -- or nil if pasted images shouldn't go into a special subdir
        image_subdir = "img",
    }
end

return M
