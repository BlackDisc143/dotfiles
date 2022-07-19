"=============================
"まだ整頓されていない.vimrc
"=============================

"NeoBundleの設定とプラグイン導入のところ
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle import start
NeoBundle 'alvan/vim-closetag'
NeoBundle 'dense-analysis/ale'
"NeoBundle 'ervandew/supertab'
NeoBundle 'kuroitu/withcat.vim'
NeoBundle 'kat0h/nyancat.vim'
NeoBundle 'LumaKernel/ddc-file'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/vim-lsp-settings'
NeoBundle 'mattn/vim-sonictemplate'
NeoBundle 'MichaelMure/mdr'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'PhilRunninger/nerdtree-buffer-ops'
NeoBundle 'prabirshrestha/vim-lsp'
NeoBundle 'preservim/nerdtree'
NeoBundle 'reireias/vim-cheatsheet'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'Shougo/ddc.vim'
NeoBundle 'shun/ddc-vim-lsp'
NeoBundle 'Shougo/pum.vim'
NeoBundle 'Shougo/ddc-around'
NeoBundle 'Shougo/ddc-matcher_head'
NeoBundle 'Shougo/ddc-sorter_rank'
NeoBundle 'Shougo/ddc-converter_remove_overlap'
NeoBundle 'simeji/winresizer'
NeoBundle 'skanehira/denops-twihi.vim'
NeoBundle 'skanehira/preview-markdown.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-denops/denops.vim'
NeoBundle 'vim-skk/skkeleton'
NeoBundle 'vim-jp/vimdoc-ja'
"---
call neobundle#end()

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

NeoBundleCheck

"airlineの設定、よくわからないので触らない
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#whitespace#enabled = 1
let g:airline#extensions#tabline#whitespace#mixed_indent_algo = 1

"上のやつのバッファの番号の表記設定
"let g:airline#extensions#tabline#buffer_idx_format = {
      "\ '0' : '0 ',
      "\ '1' : '1 ',
      "\ '2' : '2 ',
      "\ '3' : '3 ',
      "\ '4' : '4 ',
      "\ '5' : '5 ',
      "\ '6' : '6 ',
      "\ '7' : '7 ',
      "\ '8' : '8 ',
      "\ '9' : '9 '
      "\}

"airlineのカラースキーム
let g:airline_theme = 'wombat'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"アイコンの設定
let g:airline_symbols.readonly = '読専'
let g:airline_symbols.crypt = '🔒 暗号化'		"暗号化されたファイル
let g:airline_symbols.linenr = '行'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = '空'	"空白の警告(余分な空白など)
let g:airline_left_sep = ''
"let g:airline_left_sep = '>'
let g:airline_left_alt_sep = ''
"let g:airline_left_alt_sep = '>'
let g:airline_right_sep = ''
"let g:airline_right_sep = '<'
let g:airline_right_alt_sep = ''
"let g:airline_right_alt_sep = '<'
let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"モードの表記変更
let g:airline_mode_map = {
      \ 'n' : '●Normal',
      \ 'i' : '# Insert',
      \ 'R' : '/ Replace',
      \ 'c' : '? Command',
      \ 'v' : '◆Visulal',
      \ 'V' : '= Visulal-Line',
      \ '' : '■Visual-Block',
      \}

"下のバーの並び替え
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'worning' ],
      \ ]

"下のバーの設定
let g:airline_section_a = airline#section#create(['mode','crypt'])
"let g:airline_section_c = '%t %M'
let g:airline_section_c = ''
let g:airline_section_x = airline#section#create(['filetype'])
"let g:airline_section_y = airline#section#create(['fileencoding'])
"let g:airline_section_z = get(g:, 'airline_linecolumn_prefix','').'%3l:%-2v'

"上のタブラインの表示
"let g:airline#extensions#tabline#
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

"diff関連
let g:airline#extensions#hunks#non_zero_only = 1

"dotfilesで管理してるファイルの読み込みとか
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:sonictemplate_vim_template_dir = [
      \ '~/.vim/template'
      \]

"インデントを可視化するやつの設定
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_exclude_filetypes=['help','nerdtree']
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=244

"winresizerの設定
let g:winresizer_vert_resize = 1  "vsprit時/横方向の変更量"
let g:winresizer_horiz_resize = 1 "sprit時/縦方向の変更量"

set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

"vimのhtmlタグの%移動有効可プラグイン
source $VIMRUNTIME/macros/matchit.vim

let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

"NERDTreeの設定
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') && exists('b:NERDTree') && b:NERDTree.isTabTree( ) | quit | endif

"lspなんたらの設定
let g:lsp_setting_extra_paths=['/mnt/c/Users/tak_sak']
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_sings_enabled = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_sings_hint = {'text': '?'}
let g:lsp_diagnostics_sings_infomation = {'text': 'i'}

"skkeletonの設定
call skkeleton#config({'globalJisyo': '~/.skk/SKK-JISYO.L'})
"下のはなんか重くなるから使うなよ
"call skkeleton#config({'userSkkServer': v:true})

"ddcの設定
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file',
 \ 'skkeleton'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'skkeleton':{
 \   'mark': 'skkeleton',
 \   'matchers': ['skkeleton'],
 \   'sorters': [],
 \   'minAutoCompleteLength': 2,
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()


"お気に入りのカラースキーム
"molokaiは要インストール
colorscheme molokai

"vimの表示に関するあれこれ
syntax enable
set cursorline
set number
set showcmd
set shellslash
set cmdheight=1
set showtabline=2
set t_Co=256
"* airlineでこれが使えるからこれ使う理由ない気がするので一時コメントアウト
"set ruler

"インデント関連
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

"なんか勝手に作られるファイルを作らないようにするやつ
set nobackup
set noswapfile

"ファイル読み込み関連
set autoread
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

"バッファ関連
set hidden

"編集時の挙動関連
set backspace=indent,eol,start
set virtualedit=onemore
set ambiwidth=double
set scrolloff=5

"検索関連
set showmatch
set matchtime=1
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

"コマンド関連
set history=1000

"クリップボード
set clipboard=unnamed

"ファイル名補完
set wildmenu
set wildmode=list:longest,full

"よくわからんのに設定しちゃったやつ & 分類面倒な奴
set noerrorbells
set gdefault
set guioptions-=e
set ttimeoutlen=50

"マップリーダ
let mapleader=","

"キーマッピング
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <down> gj
nnoremap <silent> <up> gk
"C-w で一回で切り替えは便利だけど色々機能を犠牲にしてた
"nnoremap <silent> <C-w> <C-w><C-w>
nnoremap <CR> i<Return><ESC>^k
nnoremap <silent> <Left> :bp<CR> 
nnoremap <silent> <Right> :bn<CR>


"jjを崇めよ
inoremap <silent> jj <ESC>
inoremap <silent> JJ <ESC>
inoremap <silent> ｊｊ <ESC>
"inoremap ;jj <ESC>A;

"プラグイン絡みのキーマッピング
nnoremap <silent><F2> :NERDTreeToggle<CR>
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

"===
"こっから自作関数とかなんかどっかからコピペした奴

"VSCodeみたいに下にterminalを表示する感じのやつ
":bo terminal LL rows=10 みたいにやればそもそもこの関数いらねえわ
command -nargs=? LikeVS call LikeVS(<f-args>)
function! LikeVS(...)
  call feedkeys(":bo terminal\<CR>","n")
  for i in range(0,2)
    call feedkeys("\<C-w>","n")
  endfor
  if a:0 < 1
    silent call feedkeys(":res +10\<CR>","n")
  else
    silent call feedkeys(":res +".a:1."\<CR>","n")
  endif
endfunction

"左の行数表示を切り替えるやつ
"これ将来的にtoggle方式でできるようにする
command -nargs=? NumChan call NumChan(<f-args>)
function! NumChan(...)
  if a:0 == 0
    set number
    set norelativenumber
  elseif a:1 == 0
    set number
    set relativenumber
  else
    set nonumber
    set relativenumber
  end
endfunction

"なんだっけこれ...
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
set viewoptions-=options
