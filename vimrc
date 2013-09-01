set t_Co=256

colorscheme desert "set colorscheme
let mapleader = ";" "set leader for future use

syntax on
set nocompatible
set ru "display ruler
set nu "display line number
set sc "show uncomplete command
set sm "show the match parenthesis
set bs=2 "allow backspace to delete
set mouse=a "allow to use mouse

set whichwrap+=<,>,b,s "allow move between lines
set backspace=eol,start,indent "extend backspace

set ignorecase "ignore case, please notice the next option
set smartcase "ignore case when the pattern only contains small letters
set hls "highlight all the items which match search pattern
set is "open incsearch, do searching along with typing
nmap <leader>s :nohlsearch<enter>

"for neocomlpcache
highlight Pmenu	   ctermfg=255 ctermbg=20
highlight PmenuSel ctermfg=198 ctermbg=20

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_auto_completion_start_length=1
let g:neocomplcache_enable_auto_close_preview=1

inoremap <expr><c-c> neocomplcache#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"for different filetype
filetype plugin indent on
set ts=4 | set sw=4 | set si
autocmd FileType c,cpp,java set ts=4 | set sw=4 | set si
autocmd FileType html,js,css,ruby set ts=2 | set sw=2 | set si | set et | set sta

"for display tab
set list
set listchars=tab:>\ ,trail:.
highlight SpecialKey ctermfg=240

"for remove unwanted whitespaces
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"for c++11 syntax highlighting
autocmd BufNewFile,BufRead *.h,*.c,*.cc,*.cpp set syntax=cpp11

"for tComment
vmap <leader>c :TComment<enter>
nmap <leader>c :TComment<enter>

"for NERDTree plugin
nmap <leader>v :NERDTree<enter>

"for taglist plugin
"please install Exuberant Ctags first
nmap <leader>t :TlistOpen<enter>
let Tlist_Show_One_File = 1 "only show tags for current file
let Tlist_Exit_OnlyWindow = 1 "close vim if taglist is the last window
let Tlist_Use_Right_Window = 1 "let taglist use the right window

"for minibufexplorer plugin
let g:miniBufExplMapWindowNavArrows = 1
nmap <c-t> :bn<enter>

