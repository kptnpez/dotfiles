set nocompatible	"be iMproves, required by Vundle
filetype off		"required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins

" A pretty statusline, bufferline integration
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'

" Fuzzy Finder (files, mru, etc)
Plugin 'kien/ctrlp.vim'

" Glorious Colorscheme
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'

" Easy...motions..yeah.
Plugin 'Lokaltog/vim-easymotion'

" A fancy start screen, shows MRU etc.
Plugin 'mhinz/vim-startify'

" Vim Hardtime
Plugin 'takac/vim-hardtime'


" All of your Plugins must be added before the following line
call vundle#end()			"required
filetype plugin indent on	"required
" to ignore plugin indent changes, insted use:
"filetype plugin on


" Vundle commands
" :PluginList		- Lists configured Plugins
" :PluginInstall	- installs Plugins; append '!' to update or just :PluginUpdate
" :PluginSearch foo	- searches for foo; append '!' to refresh local cache
" :PluginClean		- confirms removal of unused plugins; appen '!' to auto-approv
"
" See :h Vundle for more details or wiki for FAQ
" Put your non Plugin stuff after this line

set laststatus=2								" might be required for lightline 
set t_Co=256									" Terminal colors 256, for fancy blingbling
set background=dark								" we're using a dark bg
set number										" Show numbers
set cursorline									" Show cursorline
syntax on										" well.. syntax on
colorscheme molokai								" the glorious colorscheme!

au BufNewfile,BufRead *.txt se ft=sh tw=79		" opens .txt w/highlight
au BufNewfile,BufRead *.tex se ft=tex tw=79		" we dont want plaintex
au BufNewfile,BufRead *.md se ft=markdown tw=79	" markdown, not modula

set showcmd										" show cmds being typed
set title										" window title
set wildmenu									" better auto complete
set wildmode=longest,list						" bash-like auto complete

""" General Settings

set hidden										" buffer change, more undo
set history=1000								" default 20
set mouse=										" disable mouse
set ttyfast										" for faster redraws etc

" Search and replace 
set gdefault									" default s//g (global)
set incsearch									" 'live'-search

set shiftround									" be clever with tabs
set shiftwidth=4								" default 8
set softtabstop=4								" 'tab' feels like <tab>
set tabstop=4									" replace <TAB> w/4 spaces

"only auto-comment newline for block comments
au FileType c,cpp setlocal comments -=:// comments +=f://

" Keybindings
let mapleader=","
" Yank to system clipboard
noremap <leader>y "+y

" Faster scrolling
map <C-j> <C-d>
map <C-k> <C-u>

" We dont need any help!
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Disable annoying ex mode (Q)
map Q <nop>

"toggle relativenumber using <leader>r 
nnoremap <leader>r :call NumberToggle()<CR>

function! NumberToggle()
	if(&relativenumber == 1)
		set relativenumber!
	else
		set relativenumber
	endif
endfunction

""" Plugin Settings
"		Lightline
let g:lightline = {
			\ 'colorscheme': 'powerline'
			\ }

"		Startify, the fancy start page
let g:ctrlp_reuse_window = 'startify' "dont split in startify
let g:startify_bookmarks = [
			\ $HOME . "/.vimrc", 
			\ ]
let g:startify_custom_header = [
			\ '	Author:		pez',
			\ ' Homepage:	http://kptnpez.de',
			\ ''
			\ ]


