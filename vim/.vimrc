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
NeoBundle 'tpope/vim-markdown'
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
NeoBundle 'ctjhoa/miro8'
NeoBundleLazy 'cohama/lexima.vim', {
\ 'autoload': {
\     'filetypes': 'lisp',
\    },
\ }
NeoBundle 'rust-lang/rust.vim'

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

" Ctr-p like
nnoremap <C-p> :Unite file_rec/async<cr>
" Grep like
nnoremap <space>/ :Unite grep:.<cr>

" I laugh in the face of danger
set nobackup
set noswapfile

if has('persistent_undo')                                                   
	let undodir = expand("~/.vim/undos")
	if !isdirectory(undodir)
		call mkdir(undodir)
	endif
	set undodir=~/.vim/undos
	set undofile
endif
