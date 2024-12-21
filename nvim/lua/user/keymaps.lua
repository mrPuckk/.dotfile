local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts) --go to the start
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts) --go to the end
-- New tab
keymap("n", "te", ":tabedit")
keymap("n", "<tab>", ":BufferLineCycleNext<Return>", opts)
keymap("n", "<s-tab>", ":BufferLineCyclePrev<Return>", opts)
keymap("n", "xx", ":bd<Return>", opts)

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')
-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
