set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
" Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'digitaltoad/vim-pug'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
" Plugin 'posva/vim-vue'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'tmhedberg/matchit'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'chazy/cscope_maps'
" Plugin 'fatih/vim-go'
Plugin 'tomtom/tcomment_vim'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
" Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
" Plugin 'junegunn/goyo.vim'

call vundle#end()     " required
filetype plugin on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

"vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"vim-go
let g:go_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0

au FileType go nmap ds <Plug>(go-def-split)
au FileType go nmap dv <Plug>(go-def-vertical)
au FileType go nmap dt <Plug>(go-def-tab)

au FileType go nmap gd <Plug>(go-doc)
au FileType go nmap gb <Plug>(go-doc-browser)
au FileType go nmap gs <Plug>(go-implements)

"nerdtree
"let g:NERDTreeDirArrows=0

map <C-n> :NERDTreeTabsToggle<CR>

nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

nnoremap * *``

nnoremap y "+y

"emmet"
" let g:user_emmet_leader_key='<Tab>'

"cscope
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"tagbar
nmap <F8> :TagbarToggle<CR>
set tags=./tags,tags;/

"ctag
" let Tlist_Use_Horiz_Window = 1
" let Tlist_Use_Right_Window = 1
" noremap <silent> <F9>  <Esc><Esc>:Tlist<CR>

"airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="papercolor"
let g:airline_powerline_fonts = 1
set linespace=0

"custom
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" colorscheme torte
" set nu
set fillchars=vert:\  
highlight VertSplit ctermbg=Black ctermfg=Black

syntax on
hi MatchParen cterm=underline ctermbg=none ctermfg=blue

set ruler
set hlsearch
set incsearch

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
set pastetoggle=<F3>
set backspace=indent,eol,start
set tabstop=2 sw=2 et
set softtabstop=4
set expandtab
set autoindent
let g:indent_guides_start_level = 1

let g:indentLine_enabled = 0
set completeopt-=preview

autocmd BufNewFile,BufRead *.jar set filetype=zip
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.ejs set filetype=javascript
"autocmd BufNewFile,BufRead *.jade set filetype=javascript

autocmd FileType css set iskeyword+=-
autocmd FileType html set iskeyword+=-
autocmd FileType javascript set iskeyword+=-

autocmd FileType html setlocal softtabstop=2
autocmd FileType css setlocal softtabstop=2
autocmd FileType javascript setlocal softtabstop=2
autocmd FileType less setlocal softtabstop=2
autocmd FileType go setlocal softtabstop=8
