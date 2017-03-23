" vundle configuration
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
"Bundle 'rking/ag.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'Raimondi/delimitMate'
Plugin 'flazz/vim-colorschemes'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-vinegar'

Plugin 'davidhalter/jedi-vim'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'tpope/vim-sleuth'

" What are the python things I actually need?
" - at least simple completion (probably across languages) - YouCompleteMe?
" - syntax checking (probably across languages) - Syntastic
" - snippets (across languages) - Snipmate?
" - debugging support
" - Fugitive
" - Project search - Ack - is there something newer?

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

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Remove toolbar
set go-=T

syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme molokai

let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

"nnoremap <leader>r <esc>:w:!clear;python %<CR>
"nnoremap <silent> <F5> :!clear;python3 %<CR>
"nnoremap <silent> <leader>r :!clear;python3 %<CR>
"nnoremap <silent> <leader>e :!clear;node %<CR>

" vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

au FileType qf wincmd J
"autocmd BufWritePost .vimrc so %

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
set synmaxcol=200

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
 
"" Highlight current line only in insert mode
""autocmd InsertLeave * set nocursorline
""autocmd InsertEnter * set cursorline
"" 
""" Makefiles require TAB instead of whitespace
""autocmd FileType make setlocal noexpandtab
"" 
""" Highlight cursor
""highlight CursorLine ctermbg=8 cterm=NONE
"
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|.hg|.svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|zip|jar|xsb)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"
"function! CloseHiddenBuffers()
"    " Tableau pour memoriser la visibilite des buffers                                                                                      
"    let visible = {}
"    " Pour chaque onglet...
"    for t in range(1, tabpagenr('$'))
"        " Et pour chacune de ses fenetres...
"        for b in tabpagebuflist(t)
"            " On indique que le buffer est visible.
"            let visible[b] = 1
"        endfor
"    endfor
"    " Pour chaque numero de buffer possible...
"    for b in range(1, bufnr('$'))
"        " Si b est un numero de buffer valide et qu'il n'est pas visible, on le
"        " supprime.
"        if bufexists(b) && !has_key(visible, b)
"            " On ferme donc tous les buffers qui ne valent pas 1 dans le tableau et qui
"            " sont pourtant charges en memoire.
"            execute 'bwipeout' b
"        endif
"    endfor
"endfun
"
"fun! EditProjectDir()
"  return ':e '.ProjectRootGuess().'/'
"endf

let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=1            " no banner
"let g:netrw_altv=1              " open files on right
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" RUN CURRENT FILE """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute current file
nmap <leader>r :call ExecuteFile()<CR>

" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
function! ExecuteFile()
	let filetype_to_command = {
		\   'javascript': 'node',
		\   'python': 'python3',
		\   'html': 'open',
		\   'sh': 'sh'
		\ }
	let cmd = get(filetype_to_command, &filetype, &filetype)
	call RunShellCommand(cmd." %s")
endfunction

" Enter any shell command and have the output appear in a new buffer
" For example, to word count the current file:
"
"   :Shell wc %s
"
" Thanks to: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
	echo a:cmdline
	let expanded_cmdline = a:cmdline
	for part in split(a:cmdline, ' ')
		if part[0] =~ '\v[%#<]'
			let expanded_part = fnameescape(expand(part))
			let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
		endif
	endfor
	botright new
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	call setline(1, 'You entered:    ' . a:cmdline)
	call setline(2, 'Expanded Form:  ' .expanded_cmdline)
	call setline(3,substitute(getline(2),'.','=','g'))
	execute '$read !'. expanded_cmdline
	setlocal nomodifiable
	1
endfunction
