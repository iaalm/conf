call plug#begin()
" color schema
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-theme'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'preservim/nerdtree'
" Easy motion
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" using more Rg now
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
Plug 'mtdl9/vim-log-highlighting'
" JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" Python
Plug 'tmhedberg/SimpylFold'
if has("win32") || has("win64")
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'nickspoons/vim-sharpenup'
    Plug 'pprovost/vim-ps1'
end
call plug#end()
set bg=light
" end vim-plug

" OS specific setting
if has("mac")
    "Mac
elseif has("win32") || has("win64") "all Windows, ie win32,win64
    vnoremap <C-c> "+y
    " terminal ctrl-v
    tnoremap <Esc> <C-w>N
    autocmd TerminalOpen * set nonumber
    " use powershell
    set shell=powershell\ -NoProfile
    set shellcmdflag=\ -c
    set shellquote=\"
    set shellxquote= 
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
" colo solarized
set nocompatible
set modeline
set number
set relativenumber
set ruler
set cursorline
set wildmenu
set autoread
set colorcolumn=80,120
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
" show search [x/y] indicate
set shortmess-=S

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
    let line = strpart(line, 0, windowwidth - len(foldedlinecount) - 8)
    " 2 for two space, one before and one after dash,
    " + 2 for possible sign column
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4

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
" select and add () around it
vnoremap ( :call AddParenthese(0)<CR>
vnoremap ) :call AddParenthese(1)<CR>
" leaders
nnoremap <leader>s :nohlsearch<CR>
nnoremap <leader>p :Commands<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>r :Sessions<CR>
" toggle backgroud between light and dark
nnoremap <leader>f :Rg <C-R><C-W><CR>
vnoremap <leader>f y:Rg <C-R>"<CR>
nnoremap <leader>g :vertical botright Git<CR>
nnoremap <leader>c gg"+yG<C-o><C-o>
nnoremap <leader>yf :let @+ = expand("%")<CR>
nnoremap <leader>yp :let @+ = expand("%:p")<CR>
nnoremap <C-p> :Files<CR>

" it seems a good idea to default no fold
set foldlevel=20
set sessionoptions-=buffers sessionoptions-=folds

" C sharp
autocmd FileType cs set laststatus=2
" autocmd FileType cs set foldlevel=2    " display namespace - class - function
autocmd FileType cs let g:sharpenup_statusline_opts = { 'Highlight': 0 }
autocmd FileType cs let g:lightline = {
\ 'active': {
\   'right': [['prefixHint'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'sharpenup']]
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent'], ['sharpenup']]
\ },
\ 'component': {
\   'prefixHint': 'sos',
\   'sharpenup': sharpenup#statusline#Build()
\ }
\}

" Java
autocmd FileType java set foldlevel=1    " display namespace - class - function

" Json
autocmd FileType json set foldlevel=20

" JavaScript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

" Windows projects
autocmd BufNewFile,BufRead *.proj set filetype=xml
autocmd BufNewFile,BufRead *.csproj set filetype=xml
autocmd BufNewFile,BufRead *.vcxproj set filetype=xml
autocmd BufNewFile,BufRead *.nuproj set filetype=xml
autocmd BufNewFile,BufRead *.sfproj set filetype=xml
autocmd BufNewFile,BufRead *.props set filetype=xml
autocmd BufNewFile,BufRead *.targets set filetype=xml

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
function! FormatJson()
    %!python -m json.tool
endfunction

" quick git command
command! -nargs=0 GGPush :execute ":Git! push -u origin " . fugitive#head(0)
command! -nargs=0 GGPull :execute ":Git! pull origin " . fugitive#head(0)

command! -nargs=0 ReloadConfig :execute ":source $MYVIMRC"
command! -nargs=0 ToggleVerbose :execute "call ToggleVerbose()"
command! -nargs=0 ToggleDark :let &bg=(&bg=='light'?'dark':'light')
