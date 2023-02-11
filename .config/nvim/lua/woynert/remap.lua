vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- select and move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-c>", "<Esc>")

-- replace Ñ
vim.keymap.set("n", "ñ", ":")
vim.keymap.set("n", "Ñ", ":")

-- system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "<leader>P", "\"+P")

-- quick file switch
vim.keymap.set("n", "<C-n>", ":bp<cr>")
vim.keymap.set("n", "<C-p>", ":bn<cr>")


-- forward delete
vim.keymap.set("i", "<C-d>", "<Del>")

