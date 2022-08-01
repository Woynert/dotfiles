" System-wide vim configuration

set nocompatible
set backspace=indent,eol,start
set history=50
set ruler

set tabstop=4
set shiftwidth=4

filetype plugin on
syntax on
set number
set smartcase

" Quick file switch
" nnoremap H gT
" nnoremap L gt
map L :bn<cr>
map H :bp<cr> 

" 80 char mark
" set colorcolumn=80
" highlight ColorColumn ctermbg=7
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%91v.\+/

" set ls=3

"if filereadable("/etc/vimrc.local")
"  source /etc/vimrc.local
"endif

call plug#begin()
"Plug 'weynhamz/vim-plugin-minibufexpl'
Plug 'ap/vim-buftabline'
Plug 'psliwka/vim-smoothie'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'leafgarland/typescript-vim'
"Plug 'styled-components/vim-styled-components', { 'branch' : 'main' }

"Plug 'pangloss/vim-javascript'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" buftabline
let g:buftabline_show=1
let g:buftabline_indicators=1

" MiniBufExpl Colors
let g:miniBufExplStatusLineText='buffers'
let g:did_minibufexplorer_syntax_inits=1
hi MBENormal               ctermfg=LightGray ctermbg=black  
hi MBEVisibleNormal        ctermfg=LightGray ctermbg=black  
hi MBEChanged              ctermfg=Red ctermbg=black
hi MBEVisibleChanged       ctermfg=Red ctermbg=black  
hi MBEVisibleActiveNormal  ctermfg=Black ctermbg=LightGray 
hi MBEVisibleActiveChanged ctermfg=Black ctermbg=Red 

" fzf
nnoremap <C-b> :Buffers<CR><Space>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-P> :Files<Cr>

" let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true, 'border':'sharp', 'hightlight':'Keyword' } }
let g:fzf_layout = { 'down': '50%' }
" let $FZF_DEFAULT_OPTS='--color=16'
" let $BAT_CONFIG_PATH='plain'
let $FZF_DEFAULT_OPTS='--color=bg+:-1,gutter:-1'
let $BAT_STYLE='plain'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Exception', 'CursorColumn', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" hide cmd line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_action = {
  \ 'ctrl-l': 'e',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
