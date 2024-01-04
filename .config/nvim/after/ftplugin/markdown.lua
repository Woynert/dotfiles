-- Written in Vimscript so I can copy it to regular Vim

vim.api.nvim_exec([[
" wrap words
:set wrap
:set linebreak

" indent with wrap
:set breakindent

" hide max char column
:set colorcolumn=0

" hide tabline
" :set showtabline=0

" paragraph navigation
" j -> gj
" k -> gk

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

]], false)
