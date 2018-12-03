"------------------------------------------------------------
" dein.vim 設定
"------------------------------------------------------------
source ~/.dein.vim

"------------------------------------------------------------
" 基本設定 Config
"------------------------------------------------------------
let mapleader = "," " キーマップリーダー
set scrolloff=3 " スクロール時の余白確保
set textwidth=0 " 一行に長い文章を書いていても自動折り返しをしない
set autoread " 他で書き換えられたら自動で読み直す
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set modelines=0 " モードラインは無効

" ペーストモード
nnoremap sp :set paste!<Enter>

"------------------------------------------------------------
" 表示 Apperance
"------------------------------------------------------------
set showmatch " 括弧の対応をハイライト
set matchpairs=(:),{:},[:],<:> " 対応する括弧や部レース「% 」で移動
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set cursorline " カーソル行をハイライト
set ttyfast " 高速ターミナル接続を行う

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" jqでjsonを整形する
nnoremap <silent> <Space>jq :%!jq '.'<Enter>

"------------------------------------------------------------
" インデント Indent
"------------------------------------------------------------
set autoindent " 自動でインデント
set smartindent " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set expandtab " <TAB>を空白に変換
set tabstop=2 " <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定。
set shiftwidth=2 " vimが自動でインデントを行った際、設定する空白数。
set softtabstop=0 " キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定。

"------------------------------------------------------------
" 補完・履歴 Complete
"------------------------------------------------------------
set wildmenu " コマンド補完を強化
set wildchar=<tab> " コマンド補完を開始するキー
" set wildmode=list:full " リスト表示，最長マッチ
set history=10000 " コマンド・検索パターンの履歴数
set complete+=k " 補完に辞書ファイル追加

" 括弧を自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " インクリメンタルサーチ
set hlsearch " 検索文字をハイライト

"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------
" insert mode でjjでesc
inoremap jj <Esc>

" 0, 9で行頭、行末へ
nnoremap 1 ^
nnoremap 9 $

" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 対応する括弧に移動
nnoremap ' %

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Shift-hjklでフレームサイズ調整
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w>>
nnoremap <S-h> <C-w><
