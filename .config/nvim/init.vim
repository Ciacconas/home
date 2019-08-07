"    _____ _     ____  ____  ____  ____  _____
"   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
"   |  __\| |   | / \||  \/|| / \||  \/|  / \
"   | |   | |_/\| |-|||  __/| \_/||    /  | |
"   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/
"

"" Plugins
"-------------------------------------------------------------------------------

" set leader key
nnoremap <Leader>del! :call delete(expand('%'))<CR>:bd!<CR>
let mapleader = ";"

" load plugins
source ~/.config/nvim/plugins.vim


"" Theme / colorscheme
"-------------------------------------------------------------------------------

" use 256 colors when possible
" set notermguicolors
" set termguicolors

" white colorscheme
" colorscheme delek

" dark colorscheme
" colorscheme material

" fisa colorscheme
" colorscheme fisa

" gruvbox colorscheme
 set background=light
 colorscheme gruvbox
 let g:gruvbox_contrast_light='hard'
 let g:gruvbox_bold=1
 let g:gruvbox_italic=1
 let g:gruvbox_italicize_strings = 1
 "colorscheme xresources

"" Useful commands inherited from plugins (incomplete list)
"-------------------------------------------------------------------------------

" fuzzy open file
" <Leader>e

" fuzzy run vim command
" <Leader>c

" fuzzy find in file
" <Leader>f

" go to definition (python)
" <Leader>d

" open file browser
" <Leader>t


"" All mode shortcuts
"-------------------------------------------------------------------------------

" sometimes, shortcuts here are twice defined, once as normal mode shortcut
" and once as insert mode shortcut. This is on purpose, as defining it once
" (with for example the `map` keyword) does not always have the intended
" behavior

" save buffer
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>

" exit current buffer without saving
"inoremap <C-c> <Esc>:bd!<CR>
"nnoremap <C-c> <Esc>:bd!<CR>

" save and exit
inoremap <C-q> <Esc>:wqa<CR>
nnoremap <C-q> <Esc>:wqa<CR>

" switch buffer
nnoremap <Leader>n :bn<cr>
nnoremap <Leader>p :bp<cr>
" buffer deleter
nnoremap <Leader>q :Bdelete<cr>
" make current split the Only split
nnoremap <C-o> :only<CR>

" close split Below
nnoremap <C-b> <C-w>j:q!<CR>

" edit this configuration file (requires set hidden)
nnoremap <F2> :e ~/.config/nvim/init.vim<CR>
inoremap <F2> <Esc>:e ~/.config/nvim/init.vim<CR>

" enable spell checker:
nnoremap <F7> :setlocal spell! spelllang=en_us<CR>
inoremap <F7> <Esc>:setlocal spell! spelllang=en_us<CR>
" use zg to add a word to the dictionary
" use zuw to remove word from dictionary
" use ]s and [s to navigate between misspelled words
" use z= to find a suggestion for the misspelled word


"" Normal mode shortcuts
"-------------------------------------------------------------------------------



"" Custom functions
"-------------------------------------------------------------------------------
command! -nargs=* T term <args>
command! -nargs=* HT split | resize 10 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

"" Navigation
"-------------------------------------------------------------------------------

" move to split below of current split
nnoremap <C-j> <C-w>j

" move to split above of current split
nnoremap <C-k> <C-w>k

" move to split left of current split
nnoremap <C-h> <C-w>h

" move to split right of current split
nnoremap <C-l> <C-w>l

" cycle through buffers
"nnoremap <C-]> :bnext<CR>
"nnoremap <C-[> :bprevious<CR>
" <C-^> switch between last two buffers


"" Run / compile / visualize
"-------------------------------------------------------------------------------

" python
autocmd FileType python nnoremap <F5> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>
autocmd FileType python inoremap <F5> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>
autocmd FileType python vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>
autocmd FileType python nnoremap <F6> <Esc>:w<CR>:HT python %<CR>
autocmd FileType python inoremap <F6> <Esc>:w<CR>:HT python %<CR>

" tex / latex / xelatex
autocmd FileType tex nnoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>G<C-w>k
autocmd FileType tex inoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>G<C-w>k
autocmd BufWritePost *.tex silent ![ -f $TEXBASE ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE || latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode
" <Leader>s  "--> latex synctex forward
function! SyncTexForward()
    " either do synctex on the pdf with basename [filename without extension] $TEXBASE,
    " or do synctex on the pdf with the same base name as the current tex file if
    " the environment variable $TEXBASE does not exist.
    let execstr = "silent ![ $TEXBASE ] && zathura --synctex-forward ".line(".").":".col(".").":%:p $TEXBASE.pdf"
    let execstr = execstr." || zathura --synctex-forward ".line(".").":".col(".").":%:p %:p:r.pdf &"
    exec execstr
endfunction
autocmd FileType tex nmap <Leader>s :call SyncTexForward()<CR>
" latex synctex backward
" Ctrl-Click
" NOTE: for backward synctex to work, one has to run neovim-remote on port 9999:
" nvr --servername 127.0.0.1:9999 filename.tex
" And add the following two lines to zathurarc:
" set synctex true
" set synctex-editor-command "nvr --servername 127.0.0.1:9999 +%{line} %{input}"
" normally, the custom nvim script in the nvim config folder will execute nvr
" in stead of nvim when a latex file is opened.

" markdown
redir => neovim_server
silent echo v:servername
redir end
autocmd FileType markdown nnoremap <C-i> 0v$"*y:read !~/.scripts/nvim/nvim_markdown_image<CR>kddk
autocmd FileType markdown nnoremap <F5> <Esc>:w<CR>:silent execute '!killall smdv; smdv % -v "'.v:servername'" &> /dev/null & disown'<CR>
autocmd FileType markdown inoremap <F5> <Esc>:w<CR>:silent execute '!killall smdv; smdv % -v "'.v:servername'" &> /dev/null & disown'<CR>
autocmd FileType markdown vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>

autocmd BufWritePost *.md silent !smdv --sync %


"" Settings
"-------------------------------------------------------------------------------

" enable different behavior for different filetypes:
set nocompatible
filetype plugin on

" automatically cd into folder of current file
autocmd BufEnter * silent! lcd %:p:h

" enable syntax highlighting
syntax enable

" underline current line if in insert mode
autocmd InsertEnter * set cul

" remove underline when in normal mode
autocmd InsertLeave * set nocul

" clear trailing spaces in python files at saving
autocmd BufWritePre *.py %s/\s\+$//e

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable undo after file save
set undofile
set undodir=$HOME/.local/share/nvim/undo

" save as sudo (make sure SUDO_ASKPASS is set to a password asking program)
ca w!! w !sudo -A tee '%' &> /dev/null

" remove ugly vertical lines in split
set fillchars+=vert:\

" fix problems with uncommon shells (fish, zsh, xonsh, ...) and plugins
" running shell commands (neomake, ...)
set shell=/bin/bash

" set a column at 90 characters
set colorcolumn=90

" disable line wrapping
set nowrap

" allow pattern matching with special characters
set magic

" new vertical splits appear on the right
set splitright

" new horizontal splits appear below
set splitbelow

" enable unicode
set encoding=utf-8

" case insensitive search when searching with lower case characters
:set ignorecase

" case sensitive search when searching with upper case characters
:set smartcase

" copy to star register by default (selection copy)
set clipboard^=unnamed

" show line numbers
set number

" set tabs to have a width of 4 spaces
set tabstop=4

" set tabs to have a maximum width of 4 spaces
set softtabstop=4

" set the shift operators (`<<` and `>>`) to insert 4 spaces
set shiftwidth=4

" replace tabs by spaces
set expandtab

" disable automatic indent when moving to the next line while writing code
set noautoindent

" show the matching part of the pair for [] {} and ()
set showmatch

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" code folding
" zM: fold all; zR: unfold all; za: toggle fold, zv: unfold one; zc: fold one
set foldmethod=indent

