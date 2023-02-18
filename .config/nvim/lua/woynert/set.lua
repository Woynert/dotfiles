--vim.opt.guicursor = "" # fat cursor

vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

vim.opt.smartindent = true

vim.opt.wrap = true

-- don't allow vim to do any backups.
-- handle it with undotree
vim.opt.swapfile = false
--vim.opt.backup   = false
--vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

-- Don't auto commenting new lines
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.formatoptions:remove("c")

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

