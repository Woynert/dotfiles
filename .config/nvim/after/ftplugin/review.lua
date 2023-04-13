vim.api.nvim_exec([[

" syntax off
" hi DiffText   cterm=none ctermfg=Yellow ctermbg=none gui=none guifg=LightYellow guibg=none    
" hi DiffChange cterm=none ctermfg=Blue ctermbg=none gui=none guifg=Blue guibg=none    
" hi DiffAdd    cterm=bold ctermfg=Green ctermbg=none gui=none guifg=bg guibg=Red    
" hi DiffDelete cterm=bold ctermfg=DarkRed ctermbg=none gui=none guifg=Red guibg=none    

nnoremap <Left> :tabp<CR>    
nnoremap <Right> :tabn<CR>    
nnoremap <Up> :tabs<CR>    
" nnoremap <Down> :windo bd<CR>
]], false)
