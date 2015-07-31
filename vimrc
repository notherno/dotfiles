"-----------------------
" 基本設定
"-----------------------
set nocompatible               " Vimとして使う
syntax enable
syntax on                      " 色をつける
set number                     " 行番号表示
colorscheme torte
set ai sm

set ts=4 sw=4 sts=0
set background=dark " 背景色
set title
set backspace=indent,eol,start " MacVimでバックスペースが上手くいかない問題を解消
set expandtab " Tabをスペースに
set autoindent cindent " 自動インデント
set clipboard=unnamed
set ruler
set noswapfile
set ls=2
set vb t_vb=

" set showmatch
"-----------------------
" 検索系
"-----------------------
set ignorecase            "小文字の検索でも大文字も見つかるようにする
set smartcase             "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch             "インクリメンタルサーチを行う
set nowrapscan            "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000          "コマンド、検索パターンを100個まで履歴に残す
set hlsearch

" ----------------------
" キーバインド
" ----------------------

" インサートモードでEnterによって改行
noremap <CR> o<ESC>
noremap <S-CR> <S-o><ESC>

" Space2回 + コンマで設定
noremap <C-y><C-y> :<C-u>tabe $MYVIMRC<CR> 
noremap <C-m><C-u> :<C-u>source $MYVIMRC<CR> 
set pastetoggle=<C-y><C-p>
" ノーマルモードで、セミコロンでもインサートモードに入れるようにする
nnoremap ; :

"pastemode
set pastetoggle=<C-p>

if &encoding == 'utf-8'
  set ambiwidth=double
endif

"-----------------------
" ハイライト
"-----------------------
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set ambiwidth=double

au BufNewFile,BufRead *.mako set filetype=html


" ----------------------
" マウスの設定
" ----------------------
if has('mouse')
	set mouse=a
endif
set guioptions+=a
" set ttymouse=xterm2

" ----------------------
" Neobundleの設定
" ----------------------

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

    " ----------------------
    " Let NeoBundle manage NeoBundle
    " ----------------------
    NeoBundleFetch 'Shougo/neobundle.vim'

    " ----------------------
    " add plugins
    " ----------------------
    filetype plugin on
    NeoBundleCheck

    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'yuratomo/w3m.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'basyura/TweetVim'
    NeoBundle 'basyura/twibill.vim'
    NeoBundle 'h1mesuke/unite-outline'
    NeoBundle 'basyura/bitly.vim'
    NeoBundle 'bling/vim-airline'
    NeoBundle 'rbtnn/puyo.vim'

call neobundle#end()


