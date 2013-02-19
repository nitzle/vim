set fileformats=unix,dos,mac
" PLUGINS
execute pathogen#infect()

" vim: se ff=unix :
" EDITING
set encoding=utf-8
set number
set expandtab sts=4 ts=4 sw=4
syntax enable
set autoindent
set scrolloff=10
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start
autocmd BufReadPost * :DetectIndent
cd ~/Dropbox/Repos/Git
filetype plugin on
map <Esc> :
" Enable shortcuts to copy/paste to Windows clipboard
if has("gui_running")
  if has("gui_win32")
    " Copy selected
    map <C-c><C-c> "+y
    " Copy entire file
    map <C-c><C-e> ggVG"+y
    " Paste from windows clipboard
    map <C-c><C-v> "+gP
  endif
endif
" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,sql autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" LOOK/FEEL
colorscheme molokai
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


" PLUGIN SETTINGS
map <C-n> :NERDTreeToggle<CR>
map <C-g><C-s> :Gstatus<CR>
map <C-g><C-d> :Gdiff<CR>
map <C-g><C-c> :Gcommit<CR>
" map <C-e> :VoraxExecBuffer<CR>
" map <C-x> :VoraxExecVisualSQL<CR>
map <Leader>c :VoraxConnect<CR>ngnazzo@PROD<CR>
let g:vorax_output_window_force_column_heading = 1
let g:EasyMotion_leader_key = '<Space>'
set directory+=,~/tmp,$TMP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }
let NERDTreeShowHidden=1
