"---------------------------------- pathogen 设置-------------------------
"pathogen插件用于管理其他vim插件，安装其他插件时候，可以直接解压覆盖到 .vim 目录下的 autoload, plugin， doc目录；
"也可以安装完pathogen之后（会在autoload目录下有一个pathogen.vim，同时在.vim 下创建 bundles目录）进入 bundles目录，
"执行 git clone xxxx 到bundles目录，利用 pathogen进行安装
execute pathogen#infect()
execute pathogen#helptags()



"定义快捷键的前缀，前缀类似于命令空间，避免多个相同的快捷键冲突
"如 c, <header> c, <header><header> c 是三个不同的快捷键
let mapleader=";"

"----------------------------------基本配置------------------------------
"关闭兼容模式
set nocompatible

"文件类型检测，可以针对不同类型的文件加载不同的插件
filetype on
"根据侦测的文件类型，加载相应的插件
filetype plugin on

"vim 自身命令行 模式自动补全
set wildmenu

"设置语法高亮
if has("syntax")
    syntax on
endif 


"高亮光标所在的行
set cul 

"用浅色高亮当前行
autocmd InsertEnter * se cul

"设置行间隔
set linespace=0

"设置退格键可用
set backspace=2

"设置匹配模式，显示匹配的括号
set showmatch

"整词换行
set linebreak

"设置光标可以从行首或行末换到另一行去
set whichwrap=b,s,<,>,[,] 

"设置使用鼠标
set mouse=a
"set mouse=

"显示行号
set number

"标志预览窗口
set previewwindow

set completeopt-=preview

"设置历史记录条数
set history=50

"设置自动写回文件
"自动把内容写回文件: 如文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-]
" 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9}  命令转到别的文件时亦然。
set autowrite

"记住上次打开文件的位置，重新打开时自动跳转到上次编辑的位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------配色方案------------------------------
syntax enable

syntax on

"设置背景色
set background=dark

"vim 配色方案
"colorscheme solarized
colorscheme desert

set t_Co=256

"设置字体
set guifont=Consolas:h11


"---------------------------------设置宽度（tab等）----
"设置tab宽度
set tabstop=4

"设置软tab宽度，软tab，用空格代替tab
set softtabstop=4

"自动缩进的宽度
set shiftwidth=4

"----------------------------------设置对齐和缩进--------
"设置自动对齐，（和上一行）
"set autoindent

"智能对齐
set smartindent

"使用c/c++语言的自动缩进方式
set cindent

"设置c/c++语言的具体缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s 

"不要用空格代替制表符
set expandtab

"在行和段开始处使用制表符
set smarttab

"-----------------------------------文件生成----------------------
"去掉输入错误的提示声音
set noeb 

"在处理未保存或只读文件的时候，弹出确认
set confirm

"禁止生成临时文件
set nobackup
set noswapfile


"------------------------------------状态行设置-----------------
"0 不显示状态行，1 当多于一个窗口时显示最后一个窗口的状态行，2 总是显示最后一个窗口的状态行
set laststatus=2 
"显示标尺，用于显示光标位置处的行号和列号。每个窗口都有自己的标尺，如果窗口有状态行，则显示在状态行，否则显示在最后一行
set ruler 

"命令行设置
"命令行显示输入的命令
set showcmd
"命令行显示当前vim的模式
set showmode

"--------------------------------------查找设置--------------------------------
"输入字符串就显示匹配点
set incsearch
"高亮显示查找结果
set hlsearch

"开启实时搜索功能
set incsearch

"搜索时大小写不敏感
set ignorecase

"--------------------------------------多窗口设置------------------------------
"打开一个新的标签页，然后ctags查找并在新的标签页面中显示当前光标处的变量或函数
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"autocmd filetype go nmap <C-\> :tab split<CR>:exec("GoDef ".expand("<cword>")) 
"nmap <F3> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <S-h> :tabprevious<CR>
nmap <S-l> :tabnext<CR>


"快捷键依次遍历子窗口
nnoremap nw <C-W><C-W>

"跳转至右方的窗口
nnoremap <Leader>l <C-W>l

"跳转至左方的窗口
nnoremap <Leader>h <C-W>h

"跳转至上方的窗口
nnoremap <Leader>k <C-W>k

"跳转至下方的窗口
nnoremap <Leader>j <C-W>j


"-------------------------------------设置多终端之间的拷贝-------------------
"visual 模式下，xw 复制选中的区域， 到另一个终端下，xr粘贴
if has("unix")
   nmap xr :r $HOME/.vimxfer<CR>
   nmap xw :'a,.w! $HOME/.vimxfer<CR>
   vmap xr c<esc>:r $HOME/.vimxfer<CR>
   vmap xw :w! $HOME/.vimxfer<CR>
else
   nmap xr :r c:/.vimxfer<CR>
   nmap xw :'a,.w! c:/.vimxfer<CR>
   vmap xr c<esc>:r c:/.vimxfer<cr>
   vmap xw :w! c:/.vimxfer<CR>
endif




"-------------------------------------ctags设置----------------------------
"按下F2重新生成tag文件，并更新taglist
map <F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:TlistUpdate<CR>
imap <F2> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
set tags+=/usr/include/c++/tags


"---------------------------------------taglist 设置 -----------------------
"因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='ctags'

"让窗口显示在右边，0的话就是显示在左边
let Tlist_Use_Right_Window=1

"让taglist可以同时展示多个文件的函数列表
let Tlist_Show_One_File=1

"非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1 

"当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Exit_OnlyWindow=1 

"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 

"实时更新tags
let Tlist_Inc_Winwidth=0

"打开 Taglist
:map tl : TlistOpen<cr>

"关闭 Taglist
:map tc : TlistClose<cr>


"---------------------------------------- cscope 设置---------------------------------
"if has("cscope")
"    set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
"    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
"    set cst " 同时搜索cscope数据库和标签文件
"    set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
"    set nocsverb
"    if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
"        cs add cscope.out
"    elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
"        cs add $CSCOPE_DB
"    endif
"    set csverb
"endif

"map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 将:cs find
" c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,然后很快再按下c）
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR><CR>

"--------------------------------------cscope 设置 2 --------------------------
function! InitCsTag()
    execute "!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
	if(executable("cscope") && has("cscope") )
		if(has('win32'))
			silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		else
			silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.inl' -o -name '*.m' -o -name '*.mm' -o -name '*.java' -o -name '*.py' -o -name '*.html' -o -name '*.php' -o -name '*.js' > cscope.files"
		endif
        silent! execute "!cscope -b"
		silent! execute "cs kill -1"
		if filereadable("cscope.out")
		    execute "cs add cscope.out"
		endif
	endif
    echohl StatusLine | echo "C/C++ cscope tag updated" | echohl None
endf

function! UpdateCsTag()
    silent! execute "!cscope -b"
    silent! execute "cs reset"
endf
    
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set csverb
endif

"nnoremap <F11> :call UpdateCsTag()
nnoremap <F9> :call InitCsTag()<CR><CR><CR><CR>
nmap <F10> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader><F10> :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <F11> :cp<cr>
nmap <F12> :cn<cr>

" 将:cs find
" c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,然后很快再按下c）
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR><CR>


"--------------------------------------------------nerdtree 设置-------------------------------------

let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'/Data/NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31

"autocmd VimEnter * NERDTreeTabs

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"map <F3> :NERDTreeMirror<CR>
"map <F3> :NERDTreeToggle<CR>
map <F3> :NERDTreeTabsToggle<CR>

"----------------------------------------------------powerline 设置-----------------------------------
set guifont=PowerlineSymbols\ for\ Powerline
set t_Co=256
let g:Powerline_symbols = 'fancy'

"防止出现乱码
let Powerline_symbols = 'compatible'
set encoding=utf8

"----------------------------------------------------代码折叠设置-------------------------------
" 用语法高亮来定义折叠
set foldmethod=syntax 

" 启动vim时不要自动折叠代码
set foldlevel=100 

" 设置折叠栏宽度
set foldcolumn=5 


"----------------------------------------------------quickfix设置-------------------------
" 按下F8，执行make clean
map <F8> :make clean<CR><CR><CR>

" 按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
 map <F7> :make<CR><CR><CR> :copen<CR><CR>

" 按下F5，光标移到上一个错误所在的行
 map <F5> :cp<CR>
 
" 按下F6，光标移到下一个错误所在的行
 map <F6> :cn<CR>

"以下的映射是使上面的快捷键在插入模式下也能用
imap <F8> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F5> <ESC>:cp<CR>
imap <F6> <ESC>:cn<CR>

"关闭quickfix window
:map ccl : ccl<cr>

"----------------------------------syntastic settings----------------------
let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  
let g:syntastic_cpp_compiler = 'clang++'  
"set error or warning signs  
"let g:syntastic_error_symbol = 'x'  
"let g:syntastic_warning_symbol = '!'  
""whether to show balloons  
let g:syntastic_enable_balloons = 1  
  
"----------------------------------omnicpp settings------------------------------
highlight   Pmenu         ctermfg=0 ctermbg=2
highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7
"set completeopt=menuone,menu,longest
"omniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
set completeopt=menuone,menu,longest,preview


"----------------------------------------------------快捷键设置---------------------------
"<F1>  gnome 终端手册
"更新ctags文件
"map <F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:TlistUpdate<CR>
"更新cscope文件
"nnoremap <F12> :call InitCsTag()
"显示或关闭nerdtree
"map <F3> :NERDTreeTabsToggle<CR>
"
"按下F5，光标移到上一个错误所在的行
"map <F5> :cp<CR>
 
"按下F6，光标移到下一个错误所在的行
"map <F6> :cn<CR>

"按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息
"map <F7> :make<CR><CR><CR> :copen<CR><CR>
"
"按下F8，执行make clean
"map <F8> :make clean<CR><CR><CR>

"
"生成cscope数据库
"nnoremap <F9> :call InitCsTag()
"cscope 查找，在当前标签页面显示
"nmap <F10> :cs find s 
"cscope 查找，在新标签页面显示可能的结果
"nmap <Leader><F10> :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"cscope前一个查找结果
"nmap <F11> :cp<cr>
"cscope后一个查找结果
"nmap <F12> :cn<cr>
"
"前一个tab页面
"nmap <S-L> :tabprevious<CR>
"后一个tab页面
"nmap <S-R> :tabnext<CR>

"快捷键依次遍历子窗口
"nnoremap nw <C-W><C-W>

"跳转至右方的窗口
"nnoremap <Leader>l <C-W>l

"跳转至左方的窗口
"nnoremap <Leader>h <C-W>h

"跳转至上方的窗口
"nnoremap <Leader>k <C-W>k

"跳转至下方的窗口
"nnoremap <Leader>j <C-W>j


"------------------------------------------
"在ubuntu下需要安装vim-gnome来支持系统剪贴板
"
"将文本块复制到系统剪贴板
vnoremap <Leader>y "+y

"系统粘贴板内容粘贴至vim
nmap <Leader>p "+p
"-----------------------------------------

