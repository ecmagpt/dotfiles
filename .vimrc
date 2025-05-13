"VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'bling/vim-airline'
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'ntpeters/vim-better-whitespace'
	Plugin 'jondkinney/dragvisuals.vim'
	Plugin 'gmarik/Vundle.vim'
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'garbas/vim-snipmate'
	Plugin 'honza/vim-snippets'
call vundle#end()

" PERSONAL

filetype plugin indent on
let mapleader="\<Space>"
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_autofind=1
let g:airline_theme="custom"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#show_close_button=0

map H 5h
map J 5j
map K 5k
map L 5l

if @% == ""
	au VimEnter * NERDTreeMirrorOpen
endif

map ` :wall<CR>:!comprun-file "%:p" norm<CR>
map ~ :wall<CR>:!comprun-file "%:p" shift<CR>
map ` :wall<CR>:!comprun-file "%:p" alt<CR>

nmap R :%s//g<Left><Left>
map <silent> O :tabe<CR>:NERDTreeMirrorOpen<CR>
map <silent> <Leader><Tab> :NERDTreeMirrorToggle<CR>
map <silent> <S-Tab> :wincmd w<CR>
noremap <Tab> gt
nnoremap <silent> <esc> :noh<CR><esc>
nnoremap <esc>^[ <esc>^[

noremap <Backspace> i<Backspace>
noremap <CR> a<CR>

inoremap {<CR> {<CR>}<Esc>ko
nnoremap ; :

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

vmap <expr> j DVB_Drag('down')
vmap <expr> k DVB_Drag('up')

syntax enable
colorscheme phoenix
set hlsearch
set incsearch
set ruler
set linebreak
set autoread
set noswapfile
set cursorline
set smarttab
set autoindent
set copyindent
set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F2>
set backspace=indent,eol,start

nmap ? :call <SID>SynStack()<CR>
function <SID>SynStack()
	echo synIDattr(synID(line("."),col("."),1),"name") . ', ' . synIDattr(synID(line("."),col("."),0),"name") . ", " . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
endfunc
