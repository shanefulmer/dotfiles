" vim-plug
call plug#begin()

"Bundle 'christoomey/vim-tmux-navigator'

Plug 'jelera/vim-javascript-syntax'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-vinegar'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'Raimondi/delimitMate'

call plug#end()


" stop vim-rooter from echoing the directory
let g:rooter_silent_chdir = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:jedi#rename_command = ""
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0 

set nocompatible
filetype plugin on
runtime macros/matchit.vim

set ignorecase
set smartcase

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Remove delay when pressing ESC
set timeoutlen=1000 ttimeoutlen=0

filetype plugin indent on

" clear the search buffer when hitting return
"nnoremap <CR> :nohlsearch<cr>

let loaded_matchparen = 1

"Remove toolbar
set go-=T

syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme molokai

let mapleader=","


" fzf config
nmap <Leader>t :Files<CR>

" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>

"nnoremap <leader>r <esc>:w:!clear;python %<CR>
"nnoremap <silent> <F5> :!clear;python3 %<CR>
"nnoremap <silent> <leader>r :!clear;python3 %<CR>
"nnoremap <silent> <leader>e :!clear;node %<CR>


" https://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
imap <C-c> <CR><Esc>O

au FileType qf wincmd J

set noshowmatch
set nobackup
" no more annoying swap file process!
set noswapfile

set number
set showtabline=0

map ; :

noremap H ^
noremap L $

" completely disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" If you like long lines with line wrapping enabled, this solves
" the problem that pressing down jumpes your cursor “over” the current
" line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural):
nnoremap j gj
nnoremap k gk

map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set guioptions-=r
set go-=L

set incsearch
set hlsearch

" set .md as a valid extension for markdown syntax highlighting
"au BufRead,BufNewFile *.md set filetype=markdown

" call JSHint when I save js files
"au BufWritePost *.js :JSHint

" fix issues with long lines
set synmaxcol=300

set guifont=Menlo\ Regular:h16
"set cindent

set expandtab

" very handy! keeps working directory up to date
set autochdir
"
"set ai " autoindent

"":set tabstop=4 " sets tabs to 4 characters
"":set shiftwidth=4
"":set softtabstop=4 " makes the spaces feel like real tabs
"" JavaScript (tabs = 4, lines = 79)

"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript set sw=4
"autocmd FileType javascript set ts=4
"autocmd FileType javascript set sts=4

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd FileType html set sw=4
autocmd FileType html set ts=4
autocmd FileType html set sts=4

autocmd FileType cs set sw=4
autocmd FileType cs set ts=4
autocmd FileType cs set sts=4

let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=1            " no banner
let g:netrw_preview=1           " open previews vertically
let g:netrw_sort_sequence = '[\/]$,*'

" absolute width of netrw window
 let g:netrw_winsize = -28
" " tree-view
" let g:netrw_liststyle = 3
"
" " use the previous window to open file
" let g:netrw_browse_split = 4
"
" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
