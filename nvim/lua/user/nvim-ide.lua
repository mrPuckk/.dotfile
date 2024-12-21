local M = {
    "ldelossa/nvim-ide",
}

-- function M.config()
--     local keymap = vim.keymap.set
--     local opts = { noremap = true, silent = true }
--
--     keymap("n", "<s-m>", "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
--     keymap("n", "<s-q>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
-- end
--
-- function M.mark_file()
--     require("harpoon.mark").add_file()
--     vim.notify "󱡅  marked file"
-- end

return M
