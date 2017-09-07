set nocompatible	"be iMproves, required by Vundle
filetype off		"required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"---------- My Plugins ---------"
" Snipmate Plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
	" Optional Snippets
Plugin 'honza/vim-snippets'

" Nice features
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'

" Glorious Colorschemes
Plugin 'whatyouhide/vim-gotham'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'

" Syntax Plugins
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'moll/vim-node'
Plugin 'suan/vim-instant-markdown'
Plugin 'mustache/vim-mustache-handlebars' "Handlebar Syntax
Plugin 'mattn/emmet-vim' "Zencoding 
Plugin 'posva/vim-vue'

" Look and Feel
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" ---- UNUSED PLUGINS ---- "
" Plugin 'lervag/vimtex' 
" Plugin 'takac/vim-hardtime'
" Plugin 'Xe/lolcode.vim'
"Plugin 'chriskempson/base16-vim'
"Plugin 'sickill/vim-monokai'

" All of your Plugins must be added before the following line
call vundle#end()			"required
filetype plugin indent on	"required
" to ignore plugin indent changes, insted use:
"filetype plugin on
" Put your non Plugin stuff after this line

set laststatus=2								" might be required for lightline 
set t_Co=256									" Terminal colors 256, for fancy blingbling
let base16colorspace=256
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
set shiftwidth=2								" default 8
set softtabstop=2								" 'tab' feels like <tab>
set tabstop=2									" replace <TAB> w/4 spaces
set expandtab

set fillchars+=vert:│							" Set Fillchars :)

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

" Add brackets automatically
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i

" .. and escape them with jj 
:inoremap jj <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" Exit insert mode with jk
imap jk <Esc>
" Disable annoying ex mode (Q)
map Q <nop>

" toggle relativenumber using <leader>r 
nnoremap <leader>r :call NumberToggle()<CR>

function! NumberToggle()
	if(&relativenumber == 1)
		set relativenumber!
	else
		set relativenumber
	endif
endfunction

" easier buffer moving with <leader>b / <leader>n  
noremap <leader>b :bprevious<CR>
noremap <leader>n :bnext<CR>
noremap <leader>/ :nohl<CR>

"---------- Plugin Settings ----------"

"		Goyo and Limelight
nnoremap <leader>g :Goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

"		Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"		Lightline
let g:lightline = {
			\ 'colorscheme': 'powerline'
			\ }
