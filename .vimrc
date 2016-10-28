"BaseSetting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden


" 見た目系
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 不可視文字を表示する
set list
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 行番号を表示
set number
" 入力中のコマンドを表示する
set showcmd
" 一行の文字数が多くてもきちんと描画
set display=lastline
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" showmatchの対応する括弧を表示する時間。1が0.1秒
set matchtime=1
" 補完候補の行数
set pumheight=10


" Tab系
" 不可視文字を可視化
"set list
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


"操作系
" コマンドラインの補完
set wildmode=list:longest
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore


" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


" キーマップ
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 入力モードをEmacs風に
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <HOME>
inoremap <C-E> <END>
inoremap <C-H> <BS>
inoremap <C-D> <Del>
inoremap <C-K> <C-O><S-D>
inoremap <C-U> <C-O>d0
inoremap <silent> <C-y> <ESC>pa
" jjでエスケープ
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもエスケープ
inoremap <silent> っj <ESC>


"vim_plug plugins
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/neocomplete.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/syntastic'
  Plug 'airblade/vim-gitgutter'
call plug#end()


""""""""""""""""""""""""""""""
" Pluginの設定
""""""""""""""""""""""""""""""
"neocomplete
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

"fugitive
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" vim-indent-guides 起動時に立ち上げ
let g:indent_guides_enable_on_vim_startup = 1

"NERDTree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

"Unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <C-P> :Unite buffer<CR>
" ファイル一覧
nnoremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
nnoremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
nnoremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-H> unite#do_action('split'))
au FileType unite inoremap <silent> <buffer> <expr> <C-H> unite#do_action('split'))
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"vim-git-gutter
let g:gitgutter_max_signs = 500
"------------------------------------------------------------------------


" filetypeの自動検出(最後の方に書く)
filetype on
