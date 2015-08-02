"-----------------------
" 基本設定
"-----------------------
set nocompatible
syntax enable
syntax on
set number
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

set showmatch

"-----------------------
" 検索系
"-----------------------
set ignorecase            "小文字の検索でも大文字も見つかるようにする
set smartcase             "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch             "インクリメンタルサーチを行う
set wrapscan            "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000          "コマンド、検索パターンを1000個まで履歴に残す

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
" nnoremap ; :

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-e> <End>

"pastemode
set pastetoggle=<C-p>

if &encoding == 'utf-8'
  set ambiwidth=double
endif

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"=======================
" Vim 修行モード
" (矢印を使えなくする)
"=======================
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" --------------------------
" Neobundle settings
" --------------------------

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

    NeoBundle 'w0ng/vim-hybrid' " colorcheme: hybrid
    NeoBundle 'mattn/emmet-vim' " HTML/CSS入力補助
    NeoBundle 'hail2u/vim-css3-syntax' " CSS3 syntax highlight

    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'basyura/twibill.vim'
    NeoBundle 'h1mesuke/unite-outline'
    NeoBundle 'bling/vim-airline' " 下方にステータスバーを表示
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme             = 'badwolf'
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
        " unicode symbols
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '◀'
        let g:airline_symbols.crypt = '🔒'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        " let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.whitespace = 'Ξ'
    NeoBundle 'tpope/vim-fugitive' " vim Git plugin
    NeoBundle 'gregsexton/gitv'
    NeoBundle 'tpope/vim-commentary'

call neobundle#end()

"--------------------
" Set colorscheme
"--------------------
colorscheme hybrid


