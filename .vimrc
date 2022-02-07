" set the runtime path to include Vundle and initialize
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
" ctrl-p
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Ag search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" set cwd to project root
Plug 'airblade/vim-rooter'
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
let g:rooter_patterns = ['.git']
let mapleader = " "
let maplocalleader = "s"
"above is from Vundle
colo desert
set modeline
"set autochdir
set number
set cursorline 
set wildmenu
set autoindent
set autoread
set ignorecase
set smartcase
"set foldmethod=indent
syntax enable
syntax on

set hlsearch
hi Pmenu ctermbg=grey
hi PmenuSel ctermfg=darkgrey
hi TabLine ctermfg=Grey ctermbg=Black
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey

" shorty indent for web
let g:rainbow_active = 1
"EasyMotion"
let g:EasyMotion_leader_key = '<leader><leader>'

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
" nnoremap <leader>r :w<CR>:!!<CR>
nnoremap <leader>r :w<CR>:AsyncRun ./%<CR>:copen<CR><C-w>k<C-w>k
nnoremap <leader>s :nohlsearch<CR>
nnoremap <leader>t :shell<CR>
nnoremap <leader>b :AsyncRun sbatch slurm<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
