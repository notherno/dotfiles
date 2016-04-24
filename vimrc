"-----------------------
" Vim configuration
"-----------------------
set nocompatible
syntax enable
syntax on
set number
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set enc=utf-8
set t_Co=256

set ts=4 sw=4 sts=0
set background=dark
set title

set backspace=indent,eol,start
set expandtab " Tab to spaces
set autoindent cindent
autocmd FileType php,html,xml,perl syntax sync minlines=500 maxlines=1000
set clipboard=unnamed
set ruler
set noswapfile
set ls=2
set vb t_vb=

set showmatch
set wildmenu
let b:is_bash = 1
set history=1000

"-----------------------
" Search Commands
"-----------------------
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" ----------------------
" Key Bindings
" ----------------------

" Set Space key to Leader
let mapleader = "\<Space>"

nnoremap <Leader>p "0p
nnoremap <Leader>P "0P

" Escape from Insert mode
inoremap <C-c> <Esc>

" Edit and reload .vimrc
noremap <silent> <Leader>, :tabe $MYVIMRC<CR> 
noremap <silent> <Leader>. :source $MYVIMRC<CR>

" C-l to reset screen and clear highlights
nnoremap <silent> <C-l> :noh<CR><C-l>

" Saving and quitting
noremap <Leader>q :bdelete<CR>
noremap <Leader>Q :bdelete!<CR>
noremap <Leader>w :write<CR>
noremap <Leader>W :write!<CR>

" Visual movement
nnoremap j gj
nnoremap k gk

" Move to tabs
noremap <Leader>j gT
noremap <Leader>k gt

" 画面上部，下部にカーソル移動
noremap <Leader>h H
noremap <Leader>l L

" 行頭，行末移動
noremap H ^
noremap L $

" Continuous indent
vnoremap > >gv
vnoremap < <gv

set pastetoggle=<C-p>

" Toggle spelling check
nmap <silent> <leader>s :set spell!<CR>

" Double width for ambiguous width characters
if &encoding == 'utf-8'
  set ambiwidth=double
endif

" Exコマンドモードで %% と入力すると現在のファイルのパスを展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"=====================================
" Vim Training (Disabling arrow keys)
"=====================================
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"-----------------------
" Highlighting
"-----------------------
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set ambiwidth=double

au BufNewFile,BufRead *.mako set filetype=html
au BufNewFile,BufRead *.ly,*.ily set filetype=lilypond

" ----------------------
" Mouse configuration
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

    NeoBundle 'vim-airline/vim-airline'
    NeoBundle 'vim-airline/vim-airline-themes'
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

    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'mattn/webapi-vim/'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'bruno-/vim-man'
    NeoBundle 'powerman/vim-plugin-AnsiEsc'
    NeoBundle 'powerman/vim-plugin-viewdoc'

    " --- Syntax Highlighting ----------------------
    NeoBundle 'gisraptor/vim-lilypond-integrator'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'hail2u/vim-css3-syntax' " CSS3 syntax highlight
    NeoBundle 'digitaltoad/vim-pug.git'
    NeoBundle 'wavded/vim-stylus'
    NeoBundle 'slim-template/vim-slim'

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

" syntax configuration
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.jade   set filetype=pug
au BufRead,BufNewFile,BufReadPre *.styl   set filetype=stylus
au BufRead,BufNewFile,BufReadPre *.slim   set filetype=slim

