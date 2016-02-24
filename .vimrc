set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'AutoClose'
Plugin 'kien/rainbow_parentheses.vim'
"Bundle 'klen/python-mode'
Bundle 'The-NERD-tree'
""Bundle 'ZenCoding.vim'  rename to the following
Bundle 'mattn/emmet-vim'
Bundle 'EasyMotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
"Plugin 'Rainbow-Parentheses-Improved'

"Plugin 'Auto-Changing-color-script'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
"above is from Vundle
"colo desert
set background=dark
colorscheme solarized
set modeline
set autochdir
set number
set cursorline 
"set foldmethod=indent

syntax enable
syntax on

set autoindent
set autoread
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"map <F5> :w<CR>make<CR>
set hlsearch
nmap s :nohlsearch<CR>

"sudo save
"cmap sw w !sudo tee %  

" shorty indent for web
autocmd FileType javascript,html,css,xml set autoindent
autocmd FileType javascript,html,css,xml set expandtab	"tab展开
autocmd FileType javascript,html,css,xml set shiftwidth=2 "每一级缩进2空格
autocmd FileType javascript,html,css,xml set tabstop=2 "一个tab占2空格
autocmd FileType javascript,html,css,xml set softtabstop=2 "每次退格删2个空格
"python
au FileType python set ts=4
au FileType python set sts=4
au FileType python set sw=4
au FileType python set et
au FileType python set ai
"RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"EasyMotion"
let g:EasyMotion_leader_key = ';'

"NERDTree
"autocmd VimEnter * NERDTree
"page up & down
"map <C-j> <C-f>
"map <C-k> <C-b>
"python mode
"let g:pymode_python = 'python3'
