"不与vi兼容
set nocompatible

"高亮开启
syntax on
"显式模式
set showmode
"显示命令
set showcmd
"开启鼠标
set mouse=a
"设置编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8  

" if has("termguicolors")
"    " fix bug for vim
"    set t_8f=^[[38;2;%lu;%lu;%lum
"    set t_8b=^[[48;2;%lu;%lu;%lum
"
"    " enable true color
"    set termguicolors
"endif

"自动读取配置
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"开启256色
set t_Co=256

"(In .vimrc_end)开启文件类型检查
filetype off

"缩进保持
set autoindent

"tab空格数
set tabstop=4

"自动将 Tab 转为空格
set expandtab

"每级缩进字符数
set shiftwidth=4

"Tab转为4个空格
set softtabstop=4

"显示行号
set number

"set relativenumber

"光标当前行高亮
set cursorline

"行宽
set textwidth=85

"自动折行
set wrap

"特定符号折行
set linebreak

"折行处与编辑窗口的右边缘之间空出的字符数
set wrapmargin=0

"垂直滚动时，光标距离顶部/底部的位置
set scrolloff=0

"水平滚动时，光标距离行首或行尾的位置
set sidescrolloff=0

"显示状态栏
set laststatus=2

"在状态栏显示光标的当前位置
set  ruler

"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

"搜索时，高亮显示匹配结果
set hlsearch

"搜索每次输入搜索
set incsearch

"搜索时忽略大小写
set ignorecase

"单词拼写检查
"set spell spelllang=en_us

"不创建备份文件
set nobackup

"创建交换文件
set swapfile

"不创建历史文件
set noundofile

"自动切换工作目录
set autochdir

"出错时，不要发出响声
set noerrorbells

"出错时，发出视觉提示
set visualbell

"保留历史
set history=1000

"打开文件监视
set autoread

"显示行尾多余空格
set listchars=tab:»■,trail:■
set list

"Tab自动补全
set wildmenu
set wildmode=longest:list,full

"Vundle设置
"------------------
"初始化
set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()

"启用Vundle
Plugin 'VundleVim/Vundle.vim'

" 启用vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" 启用ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" 启用nerdtree
Plugin 'scrooloose/nerdtree'

"启用ale
Plugin 'w0rp/ale'

call vundle#end()            " 结束
filetype plugin indent on    " 必须

"------------------
"NerdTree配置
" 高亮当前行
let NERDTreeHighlightCursorline = 1 
" 显示行号
let NERDTreeShowLineNumbers = 1 
 
" 启动 vim 时打开 NERDTree

"autocmd vimenter * NERDTree
 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
 
" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
map <leader>nt :NERDTreeToggle<CR>
" <leader>tc 关闭当前的 tab
 
map <leader>tc :tabc<CR>
 
" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>
" <leader>ts 查看所有打开的 tab
 
map <leader>ts :tabs<CR>
 
" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>
" <leader>tn 后一个 tab
 
map <leader>tn :tabn<CR>

"------------------
"ultisnips配置
let g:UltiSnipsExpandTrigger = "<c-tab>" " 代码片段补全触发
let g:UltiSnipsListSnippets = "<c-\>" " 列出补全可选列表
 
let g:UltiSnipsJumpForwardTrigger = "<c-j>" " 下一条补全
let g:UltiSnipsJumpBackwardTrigger = "<c-k>" " 上一条补全
 
let g:UltiSnipsEditSplit = "horizontal" " how the edit window is opened

"------------------
"配置vim-colors-solarized
let g:solarized_termtrans = 1 " 使用 termnal 背景
 
let g:solarized_visibility = "high" " 使用 :set list 显示特殊字符时的高亮级别

set background=light
colorscheme solarized

"------------------
"ale配置

let g:ale_lint_on_text_changed = 'normal' " 代码更改后启动检查
let g:ale_lint_on_insert_leave = 1 " 退出插入模式即检查
 
let g:ale_sign_column_always = 1 " 总是显示动态检查结果
let g:ale_sign_error = '>>' " error 告警符号
 
let g:ale_sign_warning = '--' " warning 告警符号
let g:ale_echo_msg_error_str = 'E' " 错误显示字符
 
let g:ale_echo_msg_warning_str = 'W' " 警告显示字符
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' "显示格式

"参数
let g:ale_cpp_gcc_options = '-Wall -Werror -O3 -Wextra -Wconversion -std=c++17'
 
let g:ale_cpp_clang_options = '-Wall -Werror -O3 -Wextra -Wconversion -std=c++17'
 
let g:ale_cpp_cppcheck_options = ''


let g:ale_linters = {'c++': ['clang', 'gcc'],'c': ['clang', 'gcc'],}

" <F9> 触发/关闭代码动态检查
 
map <F9> :ALEToggle<CR>
 
"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
" ad 查看错误或警告的详细信息
 
nmap ad :ALEDetail<CR>
