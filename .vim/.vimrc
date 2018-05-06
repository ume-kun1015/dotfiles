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
set noswapfile
set title

"------------------
" mouse setting
"-----------------
""set ttymouse=xterm2
"set mouse=a

"------------------
" tab setting default
" ----------------
set tabstop=4
setlocal shiftwidth=4
"set autoindent
"set smartindent

"------------------
" design
" ----------------
set listchars=tab:>\ ,extends:<
set number
highlight LineNr ctermfg=darkgrey
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"------------------
" another settings
" -----------------
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"------------------
" encodes
" ----------------
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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-rails'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'lepture/vim-jinja'
NeoBundle 'shmup/vim-sql-syntax'
call neobundle#end()

" Required: filetype プラグインによる indent を on にする
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" --------------
" plug manager
" -------------
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

"-----------------
" key mapping
" ---------------
nnoremap <C-g> :! apachectl graceful <Enter>
nnoremap <C-c>p :! php -l % <Enter>
inoremap <C-d> error_log(“”);
nnoremap <C-e>s :set encoding=sjis <Enter>
nnoremap <C-e>u :set encoding=utf-8 <Enter>
nnoremap <C-e>e :set encoding=euc-jp <Enter>
" escをctrl-jで
noremap <C-j> <esc>
noremap! <C-j> <esc>
" svで縦分割 ssで横分割 swでパネル移動
nnoremap sv :<C-u>vs<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sw <C-w>w
" 行頭、行末でジャンプ 
nnoremap <C-h> ^
vnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-l> $

set backspace=indent,eol,start
"map! ^K ^[>>   " something for the mac...

"--------------------
" NERDTree Settings
"-------------------
noremap <C-n> :NERDTree<CR>
noremap! <C-n> :NERDTree<CR>

" the property that shows all hidden files such as files that start with '.'
let NERDTreeShowHidden = 1

" the command that lets NERDTree open at the first time vim gets started.
" autocmd VimEnter * execute 'NERDTree'

" ------------------
" Unite.vim Settings
" ------------------
" let g:unite_enable_start_insert=1
" ファイル一覧
noremap <C-f> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-r> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" 検索一覧で並べられたファイルでcntl + Jと押すとウィンドウを横分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" 検索一覧で並べられたファイルでcntl + Kと押すとウィンドウを縦分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" -----------------
" Vim fugitive Settings
" ---------------
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

"------------------
" Vim Gitgugger
" ----------------
set updatetime=250

