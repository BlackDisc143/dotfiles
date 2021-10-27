
"Vundleの設定
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"導入するプラグインの一覧
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'simeji/winresizer'
Plugin 'ervandew/supertab'
Plugin 'alvan/vim-closetag'
Plugin 'reireias/vim-cheatsheet'
Plugin 'vim-jp/vimdoc-ja'
Plugin 'skanehira/preview-markdown.vim'
Plugin 'MichaelMure/mdr'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'thinca/vim-quickrun'

call vundle#end()
filetype plugin indent on

"カラー設定
set t_Co=256
"カラースキーム
colorscheme molokai

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'wombat'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.readonly = '読専'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '行'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '<'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = '空'	"空白の警告(余分な空白など)
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"チートシートのパス
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'

let mapleader=","
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_exclude_filetypes=['help','nerdtree']
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=244

set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

"vimのhtmlタグの%移動有効可プラグイン
source $VIMRUNTIME/macros/matchit.vim

syntax enable

set ruler

"highlight CursorLine cterm=UNDERLINE ctermfg=NONE ctermbg=black
"highlight CursorLineNr term=bold cterm=None ctermfg=Red ctermbg=NONE
"highlight LineNr term=bold cterm=None ctermfg=Green ctermbg=NONE
"highlight TabLine term=underline cterm=underline ctermfg=red ctermbg=black gui=underline guibg=blue
"highlight TabLineSel ctermfg=blue ctermbg=yellow
"highlight TabLineFill term=reverse cterm=reverse gui=reverse
"highlight Pmenu ctermbg=white ctermfg=black
"highlight PmenuSel ctermbg=red
"highlight PmenuSbar ctermbg=blue
"highlight PmenuThumb ctermbg=green

set cursorline
set number

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent

set nobackup
set noswapfile

set autoread
set hidden

set showcmd

set backspace=indent,eol,start

set virtualedit=onemore

set showmatch
set matchtime=1

set history=1000

set wildmenu
set wildmode=list:longest,full

set smartindent

set shellslash

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <down> gj
nnoremap <silent> <up> gk
nnoremap <silent> <C-w> <C-w><C-w>
inoremap <silent> jj <ESC>
inoremap <silent> ｊｊ <ESC>

"nnoremap <silent>
nnoremap <silent><F2> :NERDTreeToggle<CR>
nnoremap <CR> i<Return><ESC>^k

nnoremap <silent> <Left> :bp<CR> 
nnoremap <silent> <Right> :bn<CR>

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set clipboard=unnamed

set noerrorbells

set hlsearch
set incsearch

set ignorecase

set smartcase

set wrapscan

set gdefault

set ambiwidth=double

set cmdheight=1

set showtabline=2
set guioptions-=e

set scrolloff=5

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

autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
set viewoptions-=options
