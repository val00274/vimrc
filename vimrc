if &compatible
  set nomapatible
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" dein
""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath+=~/.ghq/github.com/Shougo/dein.vim 
let s:dein_dir = expand('~/.cache/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" global config
""""""""""""""""""""""""""""""""""""""""""""""""

filetype off 
filetype plugin indent on

set t_Co=256
hi Pmenu ctermbg=4

set ambiwidth=double
set autoread
set hidden
set number
set showmatch
set ttymouse=xterm2
set wildmode=longest:list
set nocompatible

" directory
set directory-=.

" clipboard
set clipboard+=unnamed

" backup
set nobackup

" encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

" tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

" tags
set tags=.tags,~/.tags

" undo
set undodir=~/.vimundo
set undofile

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

" statusline
set laststatus=2

autocmd InsertEnter * highlight StatusLine ctermfg=red guifg=red
autocmd InsertLeave * highlight StatusLine ctermfg=white guifg=white

" color
let g:solarized_termcolors=256
syntax enable
set background=dark
autocmd ColorScheme * hi Normal  ctermfg=247  ctermbg=233  cterm=none
autocmd ColorScheme * hi Comment ctermfg=242  ctermbg=none cterm=none
colorscheme solarized

" lhs comments
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,^ :s/^/^/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

" keymap
nnoremap j gj
nnoremap k gk

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

nnoremap qq :bd<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

" make
nnoremap mm :!make<CR>
nnoremap mb :!make build<CR>
nnoremap mr :!make run<CR>
nnoremap mt :!make test<CR>

nnoremap mgg :GoRun<CR>

autocmd QuickFixCmdPost *grep* cwindow

""""""""""""""""""""""""""""""""""""""""""""""""
" local config
""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('~/.vim/vimrc.local'))
source ~/.vim/vimrc.local
endif

