"-----------------------
" 基本設定
"-----------------------
set nocompatible
syntax enable
syntax on
set number
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set enc=utf-8
set t_Co=256

set ts=4 sw=4 sts=0
set background=dark " 背景色
set title

set backspace=indent,eol,start
set expandtab " Tabをスペースに
set autoindent cindent " 自動インデント
set clipboard=unnamed
set ruler
set noswapfile
set ls=2
set vb t_vb=

set showmatch
set wildmenu


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

" spaceキーをleaderキーとして設定
let mapleader = "\<Space>"

" nnoremap <Leader>p "0p

" C-cで挿入モードから抜ける
inoremap <C-c> <Esc>

" 設定変更を簡単に
noremap <silent> <Leader>, :tabe $MYVIMRC<CR> 
noremap <silent> <Leader>. :source $MYVIMRC<CR>

" 検索ハイライトを消す
nnoremap <silent> <C-l> :noh<CR><C-l>

" 終了，保存
noremap <Leader>q :bdelete<CR>
noremap <Leader>Q :bdelete!<CR>
noremap <Leader>w :write<CR>
noremap <Leader>W :write!<CR>

" タブ移動
noremap <Leader><Left> gT
noremap <Leader><Right> gt

" 画面上部，下部にカーソル移動
noremap <Leader>h H
noremap <Leader>l L

" 行頭，行末移動
noremap H ^
noremap L $

" アドホック移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 選択モードで連続インデントを実現
vnoremap > >gv
vnoremap < <gv

" ペーストモード切替え
set pastetoggle=<C-p>

" 記号などの幅を固定する
if &encoding == 'utf-8'
  set ambiwidth=double
endif

" Exコマンドモードで %% と入力すると現在のファイルのパスを展開
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
au BufNewFile,BufRead *.ly,*.ily set filetype=lilypond

" ----------------------
" マウスの設定
" ----------------------
if has('mouse')
	set mouse=a
endif
set guioptions+=a
set ttymouse=xterm2

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
    NeoBundle 'croaker/mustang-vim'
    NeoBundle 'mattn/emmet-vim' " HTML/CSS入力補助
    NeoBundle 'hail2u/vim-css3-syntax' " CSS3 syntax highlight

    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
    NeoBundle 'tyru/open-browser.vim'

    NeoBundle 'basyura/twibill.vim'
    NeoBundle 'Shougo/unite-outline'

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
        let g:airline_symbols.paste = 'PST' 
        let g:airline_symbols.whitespace = 'Ξ'

    NeoBundle 'tpope/vim-fugitive' " vim Git plugin
    NeoBundle 'gregsexton/gitv'
    NeoBundle 'tpope/vim-commentary'
    NeoBundle 'nelstrom/vim-visual-star-search'
    " neocomplcache
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'mattn/webapi-vim/'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'bruno-/vim-man'
    NeoBundle 'powerman/vim-plugin-AnsiEsc'
    NeoBundle 'powerman/vim-plugin-viewdoc'
    NeoBundle 'gisraptor/vim-lilypond-integrator'
    NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

NeoBundleCheck " check plugins update

"--------------------
" Set colorscheme
"--------------------
colorscheme hybrid

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" NERDTree Setting
nnoremap <Leader>e :NERDTreeToggle<CR>

" Coffee syntax
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

