set t_Co=256

syntax on
filetype off
set nocompatible
set noswapfile

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'

Plugin 'kchmck/vim-coffee-script'
Plugin 'rizzatti/dash.vim'

call vundle#end()

colorscheme desert "set colorscheme
let mapleader = ";" "set leader for future use

set ru "display ruler
set nu "display line number
set sc "show uncomplete command
set sm "show the match parenthesis
set bs=2 "allow backspace to delete
set mouse=a "allow to use mouse

set whichwrap=<,>,[,],b,s "allow move between lines
set backspace=eol,start,indent "extend backspace

set ignorecase "ignore case, please notice the next option
set smartcase "ignore case when the pattern only contains small letters
set hls "highlight all the items which match search pattern
set is "open incsearch, do searching along with typing
nmap <leader>s :nohlsearch<enter>

map <Up> gk
map <Down> gj
imap <Up> <C-o>gk
imap <Down> <C-o>gj

"for persistent undo
set undofile
set undodir=~/.vim/undodir

"for different filetype
filetype plugin indent on
set ts=4
" http://vim.wikia.com/wiki/Indenting_source_code
" without tabs:
set et sw=4 sts=4 si sta
" with tabs:
" set sw=4 ts=4 si
" autocmd FileType c,cpp,java set sw=4 ts=4 si
" autocmd FileType html,htmldjango,javascript,css set et sw=4 sts=4 si sta
" autocmd FileType python,ruby,php set et sw=4 sts=4 si sta

"for display tab
set list
set listchars=tab:>\ ,trail:.
highlight SpecialKey ctermfg=240

"for remove unwanted whitespaces
" autocmd FileType c,cpp,java,python,ruby,html,javascript,css,bib,tex,php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre <buffer> :%s/\s\+$//e

"for NERDTree
noremap <leader>v :NERDTree<enter>
let NERDTreeIgnore = ["\.pyc$", "\.o$"]

"for tComment
noremap <leader>c :TComment<enter>

"for minibufexplorer
let g:miniBufExplMapWindowNavArrows = 1
noremap <c-t> :bn<enter>
noremap h :bp<enter>
noremap l :bn<enter>

"for YouCompleteMe
highlight Pmenu	   ctermfg=255 ctermbg=20
highlight PmenuSel ctermfg=198 ctermbg=20
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
set completeopt=menuone

"for ag
highlight Search ctermfg=255 ctermbg=20

"for vim-airline
set laststatus=2

"for dash
noremap <leader>k :Dash<enter>
noremap <leader>K :Dash!<enter>

"i am a geek
noremap L <c-w><c-w>
