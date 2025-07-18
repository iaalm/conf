"# region leaders
let mapleader = " "
let maplocalleader = "s"
nnoremap \ :
" '-' is another mapable key
"# endregion

"# region vim-plug
call plug#begin()
" color schema
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-theme'
Plug 'rafi/awesome-vim-colorschemes'
" General
Plug 'github/copilot.vim'
Plug 'iaalm/terminal-drawer.vim', { 'branch': 'main' }
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'liuchengxu/vim-which-key'
let g:which_key_map = {}

Plug 'preservim/nerdtree'
Plug 'wellle/context.vim'
let NERDTreeQuitOnOpen=1
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
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" Json
Plug 'neoclide/jsonc.vim'
" logfile highlight
Plug 'mtdl9/vim-log-highlighting'
Plug 'MattesGroeger/vim-bookmarks'
" Python
Plug 'tmhedberg/SimpylFold'
Plug 'jmcantrell/vim-virtualenv'
let g:virtualenv_directory="."
" JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" TS
Plug 'leafgarland/typescript-vim'
" C# and Powershell
if has("win32") || has("win64")
    Plug 'pprovost/vim-ps1'
end

"# region COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" other mapping
" Symbol renaming
let g:which_key_map.c = { 'name': '+CoC'}
nmap <leader>cR :CocRestart<CR>
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>cc  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>cs  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cq  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>ce <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)
" Add `:Format` command to format current buffer
nmap <leader>cF :call CocActionAsync('format')<CR>
"# endregion
call plug#end()
set bg=light
"# endregion vim-plug

"# region OS specific setting
if has("mac")
    "Mac
    " use option key as meta
    set macmeta
elseif has("win32") || has("win64") "all Windows, ie win32,win64
    vnoremap <C-c> "+y
    tmap <LeftMouse> <C-w>N
    " use powershell
    let g:terminal_drawer_shell="pwsh"
    " set shell=powershell\ -NoProfile
    " set shellcmdflag=\ -c
    " set shellquote=\"
    " set shellxquote= 
elseif has("win32unix")
    "Cygwin
elseif has("bsd")
    "BSD-based, ie freeBSD"
elseif has("linux")
    "Linux
end
"# endregion

"# region "set" settings
if has("gui_running")
    " colo gruvbox
    colo wildcharm
    set guioptions-=m
    set guioptions-=T
else
    colo focuspoint
endif
let &bg='dark'
" colo solarized
set nocompatible
" not to enable modeline for security
" set modeline
" because number and relativenumber is local to window, use setg here
" setg number
" setg relativenumber
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
" no to make window size equal
set noequalalways
" always show statusline
set laststatus=2
" complete not search current dir
set complete-=i
" show search [x/y] indicate
set shortmess-=S
set jumpoptions=stack

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
set tags+=tags
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set signcolumn=number

" it seems a good idea to default no fold
set foldlevel=20
set sessionoptions-=buffers sessionoptions-=folds

"# endregion

"# region fix for vim slow while open big file
" https://vi.stackexchange.com/questions/5128/matchpairs-makes-vim-slow
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2
"# endregion

"# region better fold display
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
"# endregion

"# region help bar color
" hi Pmenu ctermbg=grey
" hi PmenuSel ctermfg=darkgrey
" hi TabLine ctermfg=Grey ctermbg=Black
" hi TabLineSel ctermfg=Red ctermbg=Yellow
" hi TabLineFill ctermfg=DarkGrey ctermbg=DarkGrey
"# endregion

"# region My surround.
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
"# endregion

"# region leaders
nnoremap <silent> <leader>      :<c-u>WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<localleader>'<CR>
let g:which_key_map.s = 'nohlsearch'
nnoremap <leader>s :nohlsearch<CR>
let g:which_key_map.p = ':Commands'
nnoremap <leader>p :Commands<CR>
let g:which_key_map.n = 'Find in NERDTree'
nnoremap <leader>n :NERDTreeFind<CR>
let g:which_key_map.N = 'Toogle NERDTree'
nnoremap <leader>N :NERDTreeToggle<CR>
let g:which_key_map.r = 'Load session'
nnoremap <leader>r :Sessions<CR>
" toggle backgroud between light and dark
let g:which_key_map.f = 'Rg search'
nnoremap <leader>f :Rg <C-R><C-W><CR>
vnoremap <leader>f y:Rg <C-R>"<CR>
let g:which_key_map.g = { 'name': '+Git' }
nnoremap <leader>gg :G<CR><C-W>10_
let g:which_key_map.g.g = 'Git panel'
nnoremap <leader>gp :GGPush<CR>
nnoremap <leader>gP :GGPush!<CR>
nnoremap <leader>gf :GGFetch<CR>
nnoremap <leader>gF :GGFetchThis<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gC :G commit --no-verify<CR>
nnoremap <leader>ga :G commit --amend<CR>
nnoremap <leader>gl :GGPull<CR>
"nnoremap <leader>g :vertical botright Git<CR>
let g:which_key_map.y = { 'name': '+Copy'}
let g:which_key_map.y.f = 'Copy relative path'
nnoremap <leader>yf :let @+ = expand("%")<CR>
let g:which_key_map.y.p = 'Copy absolute path'
nnoremap <leader>yp :let @+ = expand("%:p")<CR>
let g:which_key_map.y.c = 'Copy All content'
nnoremap <leader>yc gg"+yG
nnoremap <C-p> :GFiles<CR>
"# endregion

"# region vim bookmark plugins
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_sign = '>'
let g:bookmark_annotation_sign = '#'	
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:which_key_map.m = { 'name': '+Bookmark'}
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrev
"# endregion

if has('nvim')
    function! s:TermEnter(_)
      if getbufvar(bufnr(), 'term_insert', 0)
        startinsert
        call setbufvar(bufnr(), 'term_insert', 0)
      endif
    endfunction

    function! <SID>TermExec(cmd)
      let b:term_insert = 1
      execute a:cmd
    endfunction

    augroup Term
      autocmd CmdlineLeave,WinEnter,BufWinEnter * call timer_start(0, function('s:TermEnter'), {})
    augroup end

    tnoremap <silent> <C-W>.      <C-W>
    tnoremap <silent> <C-W><C-.>  <C-W>
    tnoremap <silent> <C-W><C-\>  <C-\>
    tnoremap <silent> <C-W>N      <C-\><C-N>
    tnoremap <silent> <C-W>:      <C-\><C-N>:call <SID>TermExec('call feedkeys(":")')<CR>
    tnoremap <silent> <C-W><C-W>  <cmd>call <SID>TermExec('wincmd w')<CR>
    tnoremap <silent> <C-W>h      <cmd>call <SID>TermExec('wincmd h')<CR>
    tnoremap <silent> <C-W>j      <cmd>call <SID>TermExec('wincmd j')<CR>
    tnoremap <silent> <C-W>k      <cmd>call <SID>TermExec('wincmd k')<CR>
    tnoremap <silent> <C-W>l      <cmd>call <SID>TermExec('wincmd l')<CR>
    tnoremap <silent> <C-W><C-H>  <cmd>call <SID>TermExec('wincmd h')<CR>
    tnoremap <silent> <C-W><C-J>  <cmd>call <SID>TermExec('wincmd j')<CR>
    tnoremap <silent> <C-W><C-K>  <cmd>call <SID>TermExec('wincmd k')<CR>
    tnoremap <silent> <C-W><C-L>  <cmd>call <SID>TermExec('wincmd l')<CR>
    tnoremap <silent> <C-W>gt     <cmd>call <SID>TermExec('tabn')<CR>
    tnoremap <silent> <C-W>gT     <cmd>call <SID>TermExec('tabp')<CR>
else
endif
"# region terminal
" if has('nvim')
"     autocmd TermOpen * setlocal nonumber norelativenumber
" else
"     autocmd TerminalOpen * setlocal nonumber norelativenumber
" endif
"# endregion

"# region lightline
let g:sharpenup_statusline_opts = { 'Highlight': 0 }
let g:lightline = {
\ 'active': {
\   'left': [[ 'mode', 'paste'], ['filename', 'gitbranch', 'readonly', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['bufnr', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'inactive': {
\   'left': [['filename', 'readonly', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['bufnr'] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ 'component': {
\   'bufnr': '%n'
\ }
\}
"# endregion

"# region language specific settings

" Json
autocmd FileType json set foldlevel=20
autocmd FileType json set syntax=jsonc

" JavaScript
autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
"# endregion

"# region Windows projects
autocmd BufNewFile,BufRead *.proj set filetype=xml
autocmd BufNewFile,BufRead *.csproj set filetype=xml
autocmd BufNewFile,BufRead *.vcxproj set filetype=xml
autocmd BufNewFile,BufRead *.nuproj set filetype=xml
autocmd BufNewFile,BufRead *.sfproj set filetype=xml
autocmd BufNewFile,BufRead *.props set filetype=xml
autocmd BufNewFile,BufRead *.targets set filetype=xml
"# endregion

"# region auto close windows
" Auto close git/NERDTree on leave focus
" autocmd BufLeave fugitive://* q
" autocmd BufLeave NERD_tree_* silent! :NERDTreeClose
"# endregion

"# region Misc functions
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

function RandomColorScheme()
  let l:colors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
  let l:color = l:colors[localtime() % len(l:colors)]
  let l:cname = split(split(l:color, "[/\\\\]")[-1], "\\.")[0]
  exe 'colorscheme ' . l:cname
endfunction

function GitPush(bang)
  let l:p = " "
  if a:bang == "!"
    let l:p = " --no-verify"
  endif
  :execute ":Git! push" . l:p ." -u origin " . FugitiveHead()
endfunction

function UnescapeUnicode(code, chr)
  :execute ':%s/\\\+u' . a:code . '/' . a:chr . '/ge'
endfunction

function  UnescapeLogFunction()
  " this is a function to unescape strings like \r\n\"\u003c in log file
  :%s/\\\+\(n\|r\)/\r/ge
  :g/^$/d
  :%s/\\\+\("\|'\)/\1/ge
  call UnescapeUnicode('003c', '<')
  call UnescapeUnicode('003e', '>')
endfunction
"# endregion

"# region quick git command
let g:which_key_map.x = { 'name': '+Miscellaneous'}
command! -bang -nargs=0 GGPush call GitPush("<bang>")
command! -nargs=0 GGPull :execute ":Git! pull origin " . FugitiveHead()
command! -nargs=0 GGFetch :Git! fetch origin -p
command! -nargs=0 GGFetchThis :execute ":Git! fetch origin " . FugitiveHead()
command! -nargs=0 ReloadConfig :execute ":source $MYVIMRC"
nmap <Leader>xr :ReloadConfig<CR>
command! -nargs=0 ToggleVerbose :execute "call ToggleVerbose()"
nmap <Leader>xv :ToggleVerbose<CR>
command! -nargs=0 ToggleDark :let &bg=(&bg=='light'?'dark':'light')
nmap <Leader>xd :ToggleDark<CR>
command! -nargs=0 LCD :lcd %:p:h
nmap <Leader>xc :LCD<CR>
command! -nargs=0 THEX :%!xxd
nmap <Leader>xh :THEX<CR>
command! -nargs=0 FHEX :%!xxd -r
nmap <Leader>xH :FHEX<CR>
command GitAddSafeDir :execute 'G! config --global --add safe.directory ' . join(split(getcwd(), '\\'), '/')
nmap <Leader>xs :GitAddSafeDir<CR>
command RandomColor call RandomColorScheme()
nmap <Leader>xt :RandomColor<CR>
command -nargs=0 NUM :set number relativenumber
nmap <Leader>xn :NUM<CR>
command -nargs=0 INFO :echo '#buffer: ' . bufnr('%') . ', #window: ' . winnr() . ', filetype: ' . &filetype
nmap <Leader>xi :INFO<CR>
command UnescapeLog call UnescapeLogFunction()
nmap <Leader>xe :UnescapeLog<CR>
let g:which_key_map.t = { 'name': '+Tags'}
command TagsBuild :!git ls-tree --full-tree --name-only -r HEAD | ctags -L -
nmap <Leader>tb :TagsBuild<CR>
command -nargs=1 TagsAdd :!ctags -a -R "<args>"
nmap <Leader>ta :TagsAdd<CR>
command -nargs=0 TagsDel :call delete('tags')
nmap <Leader>td :TagsDel<CR>
call which_key#register('<Space>', "g:which_key_map")
"# endregion

"# region region comment fold
"autocmd Syntax * syn region regionComment start='^[ \t]*\(#\|//\|//#\|/\* #\|"#\) \?region' end='^[ \t]*\(#\|//\|//#\|/\* #\|"#\) \?endregion' transparent fold keepend extend
"# endregion

" modelines
" vim: set foldlevel=0:
"
