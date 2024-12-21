local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
}

function M.config()
    local wk = require "which-key"
    local utils = require "telescope.utils"
    local fb_actions = require("telescope").extensions.file_browser.actions

    wk.register {
        ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        ["<leader>ff"] = { "<cmd>Telescope find_files <cr>", "Find files" },
        ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
        ["<leader>fs"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "Projects" },
        ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
        ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
        ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    }

    local icons = require "user.icons"
    local actions = require "telescope.actions"

    require("telescope").setup {

        defaults = {
            prompt_prefix = icons.ui.Telescope .. " ",
            selection_caret = icons.ui.Forward .. " ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = nil,
            layout_strategy = nil,
            layout_config = {},
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },
            file_ignore_patterns = {},
            path_display = { "smart" },
            winblend = 0,
            border = {},
            borderchars = nil,
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                },
            },
        },

        pickers = {
            live_grep = {
                theme = "dropdown",
            },

            grep_string = {
                theme = "dropdown",
            },

            -- telescope.builtin.find_files()
            find_files = {
                hidden = true,
                theme = "dropdown",
                previewer = false,
                cwd = utils.buffer_dir(), --change from cwd as efault
            },

            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "normal",
            },
        },
        extensions = {
            file_browser = {
                theme = "ivy",
                -- hidden = true,
                cwd = "~/",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
            },
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    }
end

return M
