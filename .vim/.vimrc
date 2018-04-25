syntax on
set nocompatible   " Use Vim defaults (much better!)
set bs=2      " indent,eol,start
set history=50    " keep 50 lines of command line history
set hidden
set list
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set hlsearch
set viminfo='20,<1000,s10,h

"------------------
" mouse setting
"set ttymouse=xterm2
"set mouse=a

"------------------
" tab setting default
set tabstop=4
setlocal shiftwidth=4
"set autoindent
"set smartindent

"------------------
" design
set listchars=tab:>\ ,extends:<
set number
highlight LineNr ctermfg=darkgrey
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"------------------
" another settings
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"------------------
" encodes
set termencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
" autocmd FileType html :set  encoding=sjisi

" NeoBundle Scripts---------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  "Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'w0rp/ale'

call neobundle#end()

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"-----------------
" key mapping
nnoremap <C-g> :! apachectl graceful <Enter>
nnoremap <C-c>p :! php -l % <Enter>
inoremap <C-d> error_log(“”);
nnoremap <C-e>s :set encoding=sjis <Enter>
nnoremap <C-e>u :set encoding=utf-8 <Enter>
nnoremap <C-e>e :set encoding=euc-jp <Enter>
noremap <C-j> <esc>
noremap! <C-j> <esc>

set backspace=indent,eol,start
"map! ^K ^[>>   " something for the mac...

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

