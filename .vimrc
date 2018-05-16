" Kevin's vim settings

""
" Character encoding
""
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"   set fileencodings=utf-8,latin1
"endif

""
" General settings
""
" Use Vim (vs Vi) defaults
set nocompatible	
" allow backspacing over everything in insert mode
"set bs=indent,eol,start
" keep backup file
"set backup		
" read/write a .viminfo file, don't store more
" than 50 lines of registers
set viminfo='20,\"50	
" # of lines of command line history
set history=100		
" Show cursor position at all times
set ruler		

""
" Indentation
""
" Autoindenting
set ai
set expandtab
set shiftwidth=2
set tabstop=2
"set softtabstop=4

""
" Syntax highlighting if supported
""
if &t_Co > 2 || has("gui_running")
  syntax on
  " Highlight the last used search pattern.
  set hlsearch
endif

""
" Pathogen support
""
execute pathogen#infect()

""
" 256-color mode and color settings
""
if &term=="xterm-256color"
  set t_Co=256
  set background=dark
  colors NeoSolarized
endif

""
" Default xterm settings
""
if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif


""
" Basic auto commands
""
if has("autocmd")
  augroup text
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

""
" PHP 'IDE' auto commands
""
if has("autocmd")
  augroup php
    " Run file with PHP CLID (CTRL-M)
    autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
    " PHP parser check (CTRL-L)
    autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>
    " phpDocumentor plugin, CTRL-P on a class, function or var will insert
    " the appropriate phpDoc template
    autocmd FileType php inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
    autocmd FileType php nnoremap <C-P> :call PhpDocSingle()<CR>
    autocmd FileType php vnoremap <C-P> :call PhpDocSingle()<CR>
  augroup END
endif

""
" Filetype indentation 
""
if has("autocmd")
  filetype plugin indent on
endif

""
" Informative status line
""
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

""
" PHP Folding
"""
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

""
" Typescript Quickfix compile window
""
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

packloadall
silent! helptags ALL

