" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let mapleader = " "
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
"Plugin 'Townk/vim-autoclose'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'

Bundle 'The-NERD-tree'
""Bundle 'ZenCoding.vim'  rename to the following
Plugin 'kien/ctrlp.vim'
""Bundle 'mattn/emmet-vim'
""Bundle 'EasyMotion'
Bundle 'klen/python-mode'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-misc'
Bundle 'skywind3000/asyncrun.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Rainbow-Parentheses-Improved'
"Plugin 'tpope/vim-surround'

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
colo desert
set modeline
"set autochdir
set number
set cursorline 
set wildmenu
set autoindent
set autoread
"set foldmethod=indent

syntax enable
syntax on

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set hlsearch
hi Pmenu ctermbg=grey
hi PmenuSel ctermfg=darkgrey
hi TabLine ctermfg=Grey ctermbg=Black
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey
nnoremap s :nohlsearch<CR>

" shorty indent for web
autocmd FileType javascript,html,css,xml,lua set ai
autocmd FileType javascript,html,css,xml,lua set et	"tab展开
autocmd FileType javascript,html,css,xml,lua set sw=2 "每一级缩进2空格
autocmd FileType javascript,html,css,xml,lua set ts=2 "一个tab占2空格
autocmd FileType javascript,html,css,xml,lua set sts=2 "每次退格删2个空格
autocmd FileType python set ai
autocmd FileType python set et
autocmd FileType python set sw=4
autocmd FileType python set sts=4
"RainbowParentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1
"EasyMotion"
let g:EasyMotion_leader_key = ','

"AutoClose"
"let g:AutoCloseSelectionWrapPrefix=""

"python-mode
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

"My surround.
function! AddParenthese(place)
	let [lnum_start, cnum_start] = getpos("'<")[1:2]
	let [lnum_end, cnum_end] = getpos("'>")[1:2]
	call cursor(lnum_end, cnum_end)
	norm! a)
	call cursor(lnum_start, cnum_start)
	norm! i(
	if a:place == 1
		call cursor(lnum_end, cnum_end+2)   "two character for ()
	endif
endfunction
vnoremap ( :call AddParenthese(0)<CR>
vnoremap ) :call AddParenthese(1)<CR>
inoremap <C-f> <C-x><C-f>
nnoremap <C-l> gt
nnoremap <C-h> gT
inoremap <C-e> <C-o>A
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :%s/
nnoremap <leader>r :w<CR>:!!<CR>
