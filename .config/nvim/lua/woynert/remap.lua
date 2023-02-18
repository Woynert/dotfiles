
-- select and move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

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
--vim.keymap.set("n", "<C-n>", ":bp<cr>")
--vim.keymap.set("n", "<C-p>", ":bn<cr>")
vim.keymap.set("n", "<C-h>", ":bp<cr>")
vim.keymap.set("n", "<C-l>", ":bn<cr>")


-- forward delete
vim.keymap.set("i", "<C-d>", "<Del>")

-- replace word on cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- package
vim.api.nvim_create_user_command('PS', function()
    vim.cmd("PackerSync")
end, {})
