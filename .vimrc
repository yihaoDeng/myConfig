"解决中文乱码问题
set fenc=chinese
 "处理文本中显示乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
 set fileencoding=chinese
else
 set fileencoding=utf-8
endif
 "处理菜单及右键菜单乱码
source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"处理consle输出乱码
"language messages zh_CN.utf-8
"中文乱码结束
"""""""""""""""""""""""""""""""""""""""""""""""
set shell=bash\ -i
"se listchars=tab:\|\ ,
"se list

"fold set
set foldmethod=indent
set foldlevel=10000

"tab config
set tabstop=4    " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 >个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

""""""""""""""
" tmux fixes "
""""""""""""""
" 解决Home end键失灵
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif
"""au BufWritePost *.scala :EnTypeCheck
" ----- ctags ------
" autoload tags till $HOME
set tags=./tags,tags;$HOME

set tags+=~/.vim/tags/cpp
"吴垠的配置
syntax on


"colorscheme monokai
"colorscheme desert 
"colorscheme solarized
syntax enable
set background=dark
colorscheme solarized
"let g:molokai_original = 1
" molokai setting
let g:rehash256 = 1


set ignorecase

let mapleader= ';'
" 关闭自动折行, 开启是set wrap
set nowrap

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"
let g:winManagerWindowLayout='FileExplorer'

nmap wm :WMToggle<cr>

" 行号
"set number

set incsearch
set cursorline

" cscope
if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=0
	set cst  "cscopetag, tag时也会在cscope中找
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

" miniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

" 切换buffer的快捷键
nmap <silent> <C-i>n :MBEbn<CR>
nmap <silent> <C-i>p :MBEbp<CR>

nmap <F2> :syntax enable<CR>
nmap <F3> :q!<CR>:syntax enable<CR>

" <F4> close buf
nmap <F4> :bd<CR>:syntax enable<CR>

" ycm refresh
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
" default dir is ./
nmap <F7>> :NERDTreeToggle ./<CR>

" 插件A, 在c/h文件间切换
nnoremap <silent> <F12> :A<CR>

let g:tagbar_left = 1
let g:tagbar_width = 40

"" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" All of your Plugins must be added before the following line
Bundle 'suan/vim-instant-markdown'
Bundle 'EasyGrep'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'yonchu/accelerated-smooth-scroll'
"Bundle 'Yggdroot/indentLine'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'dyng/ctrlsf.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-surround' 
"Bundle 'xolox/vim-session'
"Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-obsession'
Bundle 'jiangmiao/auto-pairs'
Bundle 'danro/rename.vim'
Bundle 'vim-scripts/BufOnly.vim'
"Bundle 'xolox/vim-easytags'
"Bundle 'xolox/vim-misc'
" 暂时先不需要snippet的功能, 有点累赘
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"Bundle 'vim-scripts/autoload_cscope.vim'
Bundle 'vim-scripts/previewtag'
Bundle 'fatih/vim-go'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/Mark'
"Bundle 'szw/vim-tags'
"Bundle 'octol/vim-cpp-enhanced-highlight'
"Bundle 'vim-scripts/TagHighlight'
"Bundle 'abudden/taghighlight'
"Bundle 'vim-scripts/Conque-Shell'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'jimenezrick/vimerl'
Bundle 'edkolev/erlang-motions.vim'
Bundle 'vim-erlang/vim-erlang-tags'

Bundle 'derekwyatt/vim-scala'

Bundle 'ensime/ensime-vim'
"Bundle 'scrooloose/syntastic'

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""
" ycm setting
" """"""""""""""""""""""""""""""
" 补全的时候不要preview, completeopt默认值为preview,menuone
"set completeopt=menuone
set completeopt-=preview
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
" 激活补全, 通常c函数需要激活补全
"let g:ycm_key_invoke_completion = '<C-/>'
let g:ycm_key_invoke_completion = '<C-Space>'
" 在完成补全之后, 自动关闭上方提示函数原型的窗口
let g:ycm_autoclose_preview_window_after_completion = 1
" 在退出insert模式后,自动关闭上方提示函数原型的窗口, 我比较喜欢这种模式
"let g:ycm_autoclose_preview_window_after_insertion=1
" 显示ycm的语法错误提醒, 会在vim的左边留出一个空白, 如果不习惯就关闭
let g:ycm_show_diagnostics_ui = 0

"ctrlp
let g:ctrlp_working_path_mode = 'ca'

" indentLine
let g:indentLine_enabled = 0
map <leader>il :IndentLinesToggle<CR>
"let g:indentLine_char = '┆'
let g:indentLine_char = '┊'

" GUndo
map <leader>ud :GundoToggle<CR>

"  vim-airline
"let g:airline#extensions#tabline#enabled = 1
" Airline {
                se laststatus=2
                se guifont=Monaco\ for\ Powerline
                se t_Co=256
                " let g:airline_powerline_fonts = 1
                if !exists('g:airline_symbols')
                        let g:airline_symbols = {}
                endif
                " let g:airline_left_sep='>'
                " let g:airline_right_sep='<'
                " let g:airline_symbols.space = "\ua0"

                " let g:airline#extensions#tabline#enabled = 1
                " let g:airline#extensions#tabline#left_sep = ' '
                " let g:airline#extensions#tabline#left_alt_sep = '|'
                "let g:airline#extensions#tabline#enabled = 1
                let g:airline_powerline_fonts = 1
                " let g:airline_theme             = 'luna'
                "let g:airline_theme='self'
                " let g:airline_theme='powerlineish'
                let g:airline_enable_branch     = 1
                let g:airline_enable_syntastic  = 1

                " vim-powerline symbols
                let g:airline_left_sep          = '⮀'
                let g:airline_left_alt_sep      = '⮁'
                let g:airline_right_sep         = '⮂'
                let g:airline_right_alt_sep     = '⮃'
                let g:airline_branch_prefix     = '⭠'
                let g:airline_readonly_symbol   = '⭤'
                let g:airline_linecolumn_prefix = '⭡'
                " let g:airline_symbols.paste = 'ρ'
                let g:airline_symbols.paste = 'Þ'
		" let g:airline_symbols.paste = '∥'
                let g:airline_symbols.whitespace = 'Ξ'
        "}

""  ctrlsf
let g:ctrlsf_ackprg = 'ag'
" 设置打开文件后自动关闭ctrlsf
let g:ctrlsf_auto_close = 1
" 设置结果前后显示的行数
let g:ctrlsf_context = '-B 3 -A 3'

"" vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
"set ambiwidth=double
let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set termencoding=utf-8

" ---------- ultisnips --------
" Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
"
"let g:UltiSnipsExpandTrigger="<C-x>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"

" ------------ vim-session ----------
"let g:session_autoload = 'yes'
"let g:session_autosave = 'yes'
"

" ----------- vim-go -----------
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>e <Plug>(go-rename)
" format with goimports instead of gofmt
"let g:go_fmt_command = "goimports"

" 设置高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"" ------------ vim-easytags --------
"
" ":autocmd FileType python let b:easytags_auto_highlight = 0
" let b:easytags_auto_highlight = 0
" let g:easytags_auto_update = 0 " stop autoupdate, use :UpdateTags to update manually
" let g:easytags_on_cursorhold=0 " make it faster

" let g:easytags_cmd = '/usr/local/bin/ctags'
" let g:easytags_opts = ['--fields=+lS']
" let g:easytags_async=1  "后台执行ctags
" " make easytags highlight faster, default is 'auto'
" "let g:easytags_syntax_keyword = 'always'
" "let g:easytags_dynamic_files=1  "easytags write to project tags, which you set by 'set tags=xxx' 
" let g:easytags_file = '~/.vim/vimtags/easytags'
" let g:easytags_dynamic_files='~/.vim/vimtags'

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ----- gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" 快捷键设置
nmap <C-x>d :GoDef<CR>
"nmap <C-x>f :YcmCompleter GoToDefinition<CR>
"nmap <C-x>g :YcmCompleter GoToDeclaration<CR>
nmap <C-p>f :CtrlP<CR>
nmap <C-p>n :CtrlPBuffer<CR>

"let g:molokai_original = 1
"let g:rehash256 = 1
