call plug#begin()
" solarized color schema
Plug 'altercation/vim-colors-solarized'
" Make sure you use single quotes
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'
" search file, buffer, MRU at same time
let g:ctrlp_cmd = 'CtrlPMixed'
Plug 'preservim/nerdtree'
let g:NERDTreeShowHidden=1
" Easy motion
Plug 'easymotion/vim-easymotion'
" Ag search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
autocmd VimEnter * command! -nargs=* -complete=file Agu :call fzf#vim#ag_raw('-U '. <q-args>)
autocmd VimEnter * command! -nargs=* -complete=file Agr :call fzf#vim#ag_raw(<q-args>)
Plug 'iaalm/fzf-session.vim'
let g:fzf_session_path = $HOME . "/.vim_session"
" set cwd to project root
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git']
" git
Plug 'itchyny/lightline.vim', { 'for': 'cs' }
"set laststatus=2
Plug 'tpope/vim-fugitive'
" logfile highlight
Plug 'andreshazard/vim-logreview'
if has("win32") || has("win64")
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'nickspoons/vim-sharpenup'
    Plug 'pprovost/vim-ps1'
end
call plug#end()
" end vim-plug

" OS specific setting
if has("mac")
    "Mac
elseif has("win32") || has("win64")
    "all Windows, ie win32,win64
    " use powershell
    "set shell=powershell\ -NoProfile
    "set shellcmdflag=\ -c
    "set shellquote=\"
    "set shellxquote= 
elseif has("win32unix")
    "Cygwin
elseif has("bsd")
    "BSD-based, ie freeBSD"
elseif has("linux")
    "Linux
end

" settings
let mapleader = " "
nnoremap s <nop>
let maplocalleader = "s"
colo solarized
set nocompatible
set modeline
set number
set ruler
set cursorline
set wildmenu
set autoread
" search
set ignorecase
set smartcase
set hlsearch
set incsearch
" display tab and tail white space
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
" complete not search current dir
set complete-=i

set list
" Display cwd on title
set titlestring=%{getcwd()}\ %f
set listchars=tab:>-,trail:<
" enable backspace anything
set backspace=indent,eol,start
"set foldmethod=indent
syntax enable
syntax on
set foldmethod=syntax
" set foldcolumn=2

" better fold display
function! FoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth

    " expand tabs into spaces
    let onetab = strpart('    ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    " always give some space to dash
    let line = strpart(line, 0, windowwidth - len(foldedlinecount) - 5)
    " 2 for three space, one before and one after dash
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 2

    return line . " " . repeat("-", fillcharcount) . " " . foldedlinecount
endfunction
set foldtext=FoldText()

hi Pmenu ctermbg=grey
hi PmenuSel ctermfg=darkgrey
hi TabLine ctermfg=Grey ctermbg=Black
hi TabLineSel ctermfg=Red ctermbg=Yellow
hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey

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
nnoremap <leader>s :nohlsearch<CR>
nnoremap <leader>p :Commands<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>r :Sessions<CR>
" toggle backgroud between light and dark
nnoremap <leader>y :let &bg=(&bg=='light'?'dark':'light')<cr>

" C sharp
autocmd FileType cs set laststatus=2
autocmd FileType cs set foldlevel=2    " display namespace - class - function
autocmd FileType cs let g:sharpenup_statusline_opts = { 'Highlight': 0 }
autocmd FileType cs let g:lightline = {
\ 'active': {
\   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'sharpenup']]
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent'], ['sharpenup']]
\ },
\ 'component': {
\   'sharpenup': sharpenup#statusline#Build()
\ }
\}

" Vim verbose log
" the log is very "verbose", so not using hidden file to notice myself to
" delete it
function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/vim_verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

