--vim.opt.guicursor = "" # fat cursor

vim.opt.laststatus = 2

vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 3
--vim.opt.signcolumn = "yes" -- <- Problematic
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 200

vim.opt.colorcolumn = '100'

vim.g.mapleader = ' '

-- Don't auto commenting new lines
vim.opt.formatoptions:remove 'r'
vim.opt.formatoptions:remove 'o'
vim.opt.formatoptions:remove 'c'

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o',
})

-- diff vertical split
vim.opt.diffopt = vim.opt.diffopt + 'vertical'

-- diff wrap
vim.opt.diffopt = vim.opt.diffopt + 'followwrap'

vim.opt.diffopt = vim.opt.diffopt + 'filler'
vim.opt.diffopt = vim.opt.diffopt + 'internal'
vim.opt.diffopt = vim.opt.diffopt + 'algorithm:patience'
vim.opt.diffopt = vim.opt.diffopt + 'indent-heuristic'

vim.opt.foldenable = false

-- https://www.reddit.com/r/vim/comments/om1uyj/comment/h5jbg2i/?utm_source=share&utm_medium=web2x&context=3
--set diffopt+=filler
--set diffopt+=internal,algorithm:patience
--set diffopt+=indent-heuristic

-- Branch diff utilitty

vim.api.nvim_exec(
    [[
command! -nargs=? Greview call s:greview(<f-args>)
function! s:greview(...)
  vsplit
  execute 'Git! diff --diff-filter=AM ' . get(a:, 1, 'development')
  setlocal buftype=nofile bufhidden=wipe noswapfile
  setlocal foldmethod=syntax foldtext=fugitive#Foldtext()
endfunction

autocmd FileType * exe "normal zR"
au WinEnter * set nofen " really disable folding
au WinLeave * set nofen
]],
    false
)
