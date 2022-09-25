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
" set nonumber
set smartcase

"set term=xterm-256color
"set t_Co=256

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

" latex
Plug 'lervag/vimtex'

Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow' " rainbow brackets

" solarized
" Plug 'lifepillar/vim-solarized8'


" Plug 'habamax/vim-godot'

" Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'

"Plug 'leafgarland/typescript-vim'
"Plug 'styled-components/vim-styled-components', { 'branch' : 'main' }

"Plug 'pangloss/vim-javascript'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" don't run on tty
if !empty($DISPLAY)
	set termguicolors
	"set background=light
endif

" solarized
"set termguicolors
"set background=dark
"set background=light
"colorscheme solarized8

" nerd commenter
let g:NERDCreateDefaultMappings = 1

" rainbow
let g:rainbow_active = 1

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

" NERD Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
