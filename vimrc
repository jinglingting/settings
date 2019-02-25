" 定义快捷键前缀, 即<Leader>
let mapleader=";"


set number
set colorcolumn=80

set nobackup
set nowritebackup
set noswapfile

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型夹在对应的差距
filetype plugin on

" 设置快捷键将选中文本块复制至系统剪贴板
vmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" buffer操作快捷键映射=========================================================
" 关闭当前buffer但是不关闭window
nmap <Leader>bq :b #\|bd #<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>

" window操作快捷键映射=========================================================
" 定义快捷键保存所有窗口内容并退出vim
nmap <Leader>wa :wa<CR>:q<CR>
" 不做任何保存,直接退出vim
nmap <Leader>qa :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>wl <C-W>l
" 跳转到左方的窗口
nnoremap <Leader>wh <C-W>h
" 跳转到上方的子窗口
nnoremap <Leader>wk <C-W>k
" 跳转到下方的子窗口
nnoremap <Leader>wj <C-W>j
" 调整window窗口的大小
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w_ <C-w>_
nnoremap <Leader>w\| <C-w>\|

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写敏感
set noignorecase
" 关闭兼容模式
set nocompatible
set backspace=indent,eol,start 
" vim自身命令行模式只能补全
set wildmenu


"==============================================================================
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" 插件管理工具
Plugin 'VundleVim/Vundle.vim'
" 主题
Plugin 'altercation/vim-colors-solarized'
" 状态栏
Plugin 'vim-airline/vim-airline'
" 目录树
Plugin 'scrooloose/nerdtree'
"  Plugin 'nathanaelkane/vim-indent-guides'
" python自动缩进
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'ervandew/supertab'
" python自动补全
Plugin 'davidhalter/jedi-vim'
" Plugin 'derekwyatt/vim-fswitch'
" Plugin 'kshenoy/vim-signature'
" 标签
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
" tagbar标签
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" 内容查找
Plugin 'dyng/ctrlsf.vim'
" 光标多处选择
Plugin 'terryma/vim-multiple-cursors'
" 注释
Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" pep8代码风格检查
" Plugin 'nvie/vim-flake8'
" python全能插件
" Plugin 'python-mode/python-mode'
" vim markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" markdown实时预览
" Plugin 'suan/vim-instant-markdown'
Plugin 'iamcco/markdown-preview.vim'
" Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"******************************************************************************
" 语法检查
Plugin 'w0rp/ale'
" Plugin 'scrooloose/syntastic'
" vebugger 调试
Plugin 'Shougo/vimproc.vim'
Plugin 'idanarye/vim-vebugger'
" 中文输入状态下ESC可以直接使用命令模式,无需切换到英文状态
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
"==============================================================================


"******************************************************************************
" 设置背景色主题
let g:solarized_termcolors=256
set background=light
colorscheme solarized

"******************************************************************************
" airline设置
" 设置状态栏主题风格
let g:airline#extensions#tabline#enabled = 1

"******************************************************************************
" nerdtree 插件
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"******************************************************************************
" ctrlsf 配置
" 使用 ctrlsf.vim  插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in  project
nnoremap <Leader>sp :CtrlSF<CR>

"******************************************************************************
" tagbar设置
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>tb :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_autofocus = 1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }
"******************************************************************************

let python_highlight_all=1
syntax on

"******************************************************************************
" vim-vebugger
" 设置vebugger的vebugger_leader激活vebugger的快捷键
let g:vebugger_leader = '<Leader><Leader>'
" 自定义vebugger快捷键
nnoremap <F5> :call VebuggerDebug()<CR>
func! VebuggerDebug()
    exec 'w'
    if &filetype == 'python'
        exec ':VBGstartPDB %'
    endif
endfunc
nnoremap <Leader><Leader>k :VBGkill<CR>
"supertab配置******************************************************************
let g:SuperTabDefaultCompletionType = "context"

"jedi配置**********************************************************************
let g:jedi#auto_initialization = 1
inoremap <Tab> g:jedi#completions_command()
nnoremap <Leader>gc g:jedi#completions_command()
nnoremap <Leader>gd g:jedi#goto_command()
nnoremap <Leader>gk g:jedi#documentation_command()
nnoremap <Leader>gr g:jedi#rename_command()
nnoremap <Leader>gu g:jedi#usages_command()
"******************************************************************************
"ale 配置
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
" nmap <Leader>d :ALEDetail<CR>
" 使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pycodestyle'],
\}
"******************************************************************************
" vim markdown
" 关闭插件自带的折叠配置
let g:vim_markdown_folding_disabled = 1
" 
let g:vim_markdown_folding_style_pythonic = 1
"******************************************************************************
" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
"******************************************************************************
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
set foldmethod=indent

" set foldmethod=syntax
" set foldmethod=manual
" 启动 vim 时关闭折叠代码
set nofoldenable

" better indentation
vnoremap < <gv 
vnoremap > >gv
