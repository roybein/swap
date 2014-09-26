" Maintainer: Robin Bian <roybein@gmail.com>
" Last change: change2012-12-11

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" global menus and mappings
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>

imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>

"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
"
"map  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
			\                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"imap  <silent> <s-tab>  <Esc>:if &modifiable && !&readonly && 
			\                  &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"
"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
"xnoremap  '  s''<Esc>P<Right>
"xnoremap  "  s""<Esc>P<Right>
"xnoremap  `  s``<Esc>P<Right>
"                         
"-------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"-------------------------------------------------------------------------------
noremap <silent> <F9>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F9>  <Esc><Esc>:Tlist<CR>

" calling sdcv program
noremap F :call Mydict()<CR>
" toggle spell <C-F2>
noremap <silent> <F10> :if &spell<Bar>set nospell<Bar>echo 'spell off'<Bar>else<Bar>set spell<Bar>echo 'spell on'<Bar>endif<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
" enable and disable
""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set incsearch
set hlsearch
set showcmd
"set backup
"set autoindent
"set smartindent
"set cindent
set noerrorbells
set novisualbell
set modeline
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time



""""""""""""""""""""""""""""""""""""""""""""""""""
" misc
""""""""""""""""""""""""""""""""""""""""""""""""""


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set fileformats=unix,dos
" set foldcolumn=1

"set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""
" fonts and appearance
""""""""""""""""""""""""""""""""""""""""""""""""""


colorscheme torte
highlight Search term=reverse ctermfg=0 ctermbg=3 gui=bold guifg=Black guibg=Red
highlight StatusLine term=reverse cterm=NONE ctermbg=darkred ctermfg=white gui=NONE guibg=darkred guifg=white
highlight StatusLineNC term=reverse cterm=NONE ctermbg=blue ctermfg=white gui=NONE guibg=blue guifg=white
highlight VertSplit ctermfg=blue ctermbg=white guifg=blue guibg=white
highlight Folded guibg=#252525
highlight FoldColumn guibg=#252525
highlight LineNr ctermfg=yellow ctermbg=darkblue guifg=yellow guibg=darkblue
if has('x11')
	set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 10
	set printfont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 10
endif

" toggle toolbar off
" set guioptions-=T

" set statusline
set laststatus=2
set statusline=
set statusline+=[#%n] "buffer number
set statusline+=%1*[%5.20t]%*  "file name (tail)
set statusline+=%2*%m%*   "modified flag
set statusline+=%<    "truncate here
set statusline+=%r        "readonly flag
"set statusline+=%h        "help flag
set statusline+=[%{&ff}]  "fileformat
set statusline+=[%{&fileencoding}] "fileencoding
set statusline+=%y      "filetype
set statusline+=%=      "aligning separator
set statusline+=[%02Bh]  "char hex value
set statusline+=[%l,%c%V] "line num and column num
set statusline+=[%P]      "percentage
"highlight modified flag
highlight User1 ctermfg=green ctermbg=darkblue guifg=green guibg=darkblue
highlight User2 ctermfg=yellow ctermbg=darkblue guifg=yellow guibg=darkblue



""""""""""""""""""""""""""""""""""""""""""""""""""
" language and encoding
""""""""""""""""""""""""""""""""""""""""""""""""""

" auto detect gb2312 font and convert to utf8
" 我的 vimrc 里边有这些东西，好像可以自动检测到 gb2312 的文件并且自动转换。文件保存后还是 gb2312 charset的。
"set ffs=unix,dos,mac " support all three, in this order

" set encoding=utf-8
" set fileencodings=utf-8,cp936,big5,latin1
" set fileencoding=utf-8
" set termencoding=utf-8
" 
" set nospell
" set spelllang=en



""""""""""""""""""""""""""""""""""""""""""""""""""
" tab setting
""""""""""""""""""""""""""""""""""""""""""""""""""


set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab



""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype settings (all)
""""""""""""""""""""""""""""""""""""""""""""""""""


filetype plugin on
"filetype indent on



""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype python
""""""""""""""""""""""""""""""""""""""""""""""""""


if has("autocmd")
	" set tab settings for python
	autocmd FileType python
				\   setlocal tabstop=8      |
				\   setlocal softtabstop=4  |
				\   setlocal shiftwidth=4
	" set makeprg
	autocmd FileType python
				\   setlocal makeprg=python\ %
	" new file template
	autocmd BufNewFile *.py normal a#!/usr/bin/env python
endif



"""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - bufexplorer
"""""""""""""""""""""""""""""""""""""""""""""""""


menu &Plugin.&BufExplorer<Tab><Leader>be :BufExplorer<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - calendar
"""""""""""""""""""""""""""""""""""""""""""""""""


" menu &Plugin.&Calendar :Calendar<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - latexsuite
""""""""""""""""""""""""""""""""""""""""""""""""""


" IMPORTANT: latexsuite need be installed by yourself.
" see: http://vim-latex.sourceforge.net

"This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" This enables automatic indentation as you type.
" filetype indent on

" tex_flavor = latex
let g:tex_flavor='context'

" set multiple compile formats
let g:Tex_MultipleCompileFormats='dvi,pdf'

" set default rules
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='evince'


"""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - minibufexpl
"""""""""""""""""""""""""""""""""""""""""""""""""


let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
menu &Plugin.&miniBufExpl.&Toggle :TMiniBufExplorer<CR>
menu &Plugin.&miniBufExpl.&Open<Tab><Leader>mbe :MiniBufExplorer<CR>
menu &Plugin.&miniBufExpl.&Close :CMiniBufExplorer<CR>
menu &Plugin.&miniBufExpl.&Update :UMiniBufExplorer<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - project
"""""""""""""""""""""""""""""""""""""""""""""""""


let g:proj_flags="gisT" 
menu &Plugin.&Project<Tab><F12>  <F12>
if has('x11')
	let g:proj_run1="silent !gnome-open %F"
endif



"""""""""""""""""""""""""""""""""""""""""""""""""
" plugin - taglist
"""""""""""""""""""""""""""""""""""""""""""""""""


let Tlist_Show_Menu=1
if !has('gui')
	let Tlist_Inc_Winwidth=1
endif
" toggle taglist menu
menu T&ags.&TlistToggle<Tab><F9> <F9><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros for bash support
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:BASH_AuthorName   = 'Robin Bian'
let g:BASH_Email        = 'bianrh@marvell.com'
let g:BASH_Company      = 'MARVELL'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Calling sdcv to look up the dictionary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! Mydict()
	let expl=system('sdcv -n ' .
				\  expand("<cword>"))
	windo if
				\ expand("%")=="diCt-tmp" |
				\ q!|endif
	25vsp diCt-tmp
	setlocal buftype=nofile bufhidden=hide noswapfile
	1s/^/\=expl/
	1
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trac server configuration area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" blogit configuration area
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format the code with astyle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add copyright header to the c source file
""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! AddCopyrightHeader()
	let l:year = strftime("%Y")
	0 put ='/* Copyright (C) 2003-' . l:year . ', MARVELL.'
	put =' *'
	put =' * Author: Robin Bian <bianrh@marvell.com>'
	put =' * $Header$'
	put =' */'
endfun
command! -nargs=0 AddCopyrightHeader :call AddCopyrightHeader()

""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype C
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	" set tab settings for c,cpp
	autocmd FileType c,cpp
				\   setlocal tabstop=4      |
				\   setlocal softtabstop=4  |
				\   setlocal shiftwidth=4   |
                \   setlocal preserveindent
	" set formatprg
	autocmd FileType c,cpp
				\   setlocal formatprg=astyle\ -s4lSKwYm0pHUjk3z2
endif

map <S-F> <Esc>:%! astyle -s4lSKwYm0pHUjk3z2<CR>
