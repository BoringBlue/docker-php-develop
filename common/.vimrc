syntax on
filetype off
filetype plugin off
filetype indent off
filetype plugin indent on

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc
set laststatus=2
set spell spelllang=en_us
set undofile
set number
set relativenumber
set ruler
set clipboard+=unnamed
set cursorline
set nobackup
set noswapfile
set showmatch
set matchtime=2
set textwidth=0
set nocompatible
set showcmd
set wildmenu
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set autochdir
set autoread
set nowrap
set paste
set listchars=tab:>-,trail:-
set incsearch
set ignorecase
set smartcase
set hlsearch
set scrolloff=8
set foldmethod=indent
set foldlevel=99

" 连续键配置
let mapleader="," " 设置连续键前缀为,(默认为\)
" 配置buffer快捷切换方式，使用:ls可以查看所有的buffer {{{
    nnoremap <leader>1 :1b<CR>
    nnoremap <leader>2 :2b<CR>
    nnoremap <leader>3 :3b<CR>
    nnoremap <leader>4 :4b<CR>
    nnoremap <leader>5 :5b<CR>
    nnoremap <leader>6 :6b<CR>
" }}}
" 分屏连续键设置{{{
	nnoremap <leader>sl :set splitright<CR>:vsplit<CR>
	nnoremap <leader>sh :set nosplitright<CR>:vsplit<CR>
	nnoremap <leader>sk :set nosplitbelow<CR>:split<CR>
	nnoremap <leader>sj :set splitbelow<CR>:split<CR>
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-h> <C-w>h
	nnoremap <C-l> <C-w>l
	nnoremap <up> :res +1<CR>
	nnoremap <down> :res -1<CR>
	nnoremap <left> :vertical resize-1<CR>
	nnoremap <right> :vertical resize+1<CR>
" }}}
" 设置连续键快捷插入成对符号 {{{
    vnoremap <leader>r( di(<Esc>pa)<Esc>
    vnoremap <leader>r{ di{<Esc>pa}<Esc>
    vnoremap <leader>r" di"<Esc>pa"<Esc>
    vnoremap <leader>r' di'<Esc>pa'<Esc>
    vnoremap <leader>r[ di[<Esc>pa]<Esc>
" }}}
" 缩进连续键设置：使用tab键缩进 {{{
    nnoremap <Tab> V>
    nnoremap <s-Tab> V<
    vnoremap <Tab> >gv
    vnoremap <s-Tab> <gv
" }}}
" tab连续键设置 {{{
	map ta :tabe<CR>
	map tn :tabprev<CR>
	map tp :tabnext<CR>
" }}}
" 移动键设置 {{{
	nnoremap J 5j
	nnoremap K 5k
	nnoremap H 5h
	nnoremap L 5L
" }}}
" 保存退出快捷键 {{{
    noremap <leader>q <Esc>:q<CR>
    noremap <leader>s <Esc>:w<CR>
	noremap <leader>x <Esc>:x<CR>
	noremap <leader>Q <Esc>:q!<CR>
	noremap <leader>S <Esc>:w!<CR>
" }}}
" 代码块收起/展开 {{{
	noremap + za
" }}}
nnoremap <leader><Esc> :nohlsearch<CR>
vnoremap <leader>y "+y
map <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l

augroup default
	autocmd!
	autocmd BufWritePost .vimrc source $HOME/.vimrc
augroup end
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
