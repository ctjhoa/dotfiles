" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
  if !filereadable(NeoBundle_readme)
    silent !curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'junegunn/gv.vim'
NeoBundle 'ctjhoa/miro8'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'hecal3/vim-leader-guide'
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'ctjhoa/spacevim'
NeoBundle 'kovisoft/paredit'
NeoBundle 'sheerun/vim-polyglot'
NeoBundleLazy 'elzr/vim-json', {
\ 'autoload': {
\     'filetypes': 'json',
\    },
\ }
NeoBundleLazy 'cohama/lexima.vim', {
\ 'autoload': {
\     'filetypes': 'lisp',
\    },
\ }
NeoBundleLazy 'tpope/vim-markdown', {
\ 'autoload': {
\     'filetypes': 'markdown',
\    },
\ }
NeoBundleLazy 'cespare/vim-toml', {
\ 'autoload': {
\     'filetypes': 'toml',
\    },
\ }
NeoBundleLazy 'rust-lang/rust.vim', {
\ 'autoload': {
\     'filetypes': 'rust',
\    },
\ }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jason Wryan colorscheme
colorscheme miro8

" 256 colors
set t_Co=256

" Line number
set number

set cursorline

" I laugh in the face of danger
set nobackup
set noswapfile

" Persistent undo
if has('persistent_undo')
	let undodir = expand("~/.vim/undos")
	if !isdirectory(undodir)
		call mkdir(undodir)
	endif
	set undodir=~/.vim/undos
	set undofile
endif

let mapleader = " "

" Escape to quit
function! s:UniteSettings()
	let b:actually_quit = 0
	setlocal updatetime=3
	au! InsertEnter <buffer> let b:actually_quit = 0
	au! InsertLeave <buffer> let b:actually_quit = 1
	au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
endfunction
au FileType unite call s:UniteSettings()

" Unite settings
call unite#custom#profile('default', 'context', {
			\ 'start_insert': 1,
			\ 'winheight': 10,
			\ 'direction': 'botright',
			\ })

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
