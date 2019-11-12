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

" go to edit mode in terminal emulator:
tnoremap <Esc> <C-\><C-n>


"" Custom functions
"-------------------------------------------------------------------------------
command! -nargs=* T term <args>
command! -nargs=* HT split | resize 10 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>


"" Navigation
"-------------------------------------------------------------------------------

" move to split below of current split
nnoremap <C-j> <C-w>j<C-A>
tnoremap <C-j> <C-\><C-N><C-w>j " navigation out of terminal mode

" move to split above of current split
nnoremap <C-k> <C-w>k
tnoremap <C-k> <C-\><C-N><C-w>k " navigation out of terminal mode

" move to split left of current split
nnoremap <C-h> <C-w>h
tnoremap <C-h> <C-\><C-N><C-w>h " navigation out of terminal mode

" move to split right of current split
nnoremap <C-l> <C-w>l
tnoremap <C-l> <C-\><C-N><C-w>l " navigation out of terminal mode

" make current split the only split
nnoremap <C-o> :only<cr>
tnoremap <C-o> <C-\><C-N>:only<cr>

" swap splits (from https://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim#2591946)
function! DoWindowSwap()
    let g:markedWinNum = 0
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction
" zoom split:
nnoremap <silent> <leader>z :call DoWindowSwap()<CR><C-w>h<C-w>h<C-w>h<C-w>k<C-w>k<C-w>k

" move current split in small horizontal split and make split behind the main
" one.


" cycle through buffers
nnoremap <C-]> :bnext<CR>
tnoremap <C-]> <C-\><C-N>:bnext<cr>
" nnoremap <C-[> :bprevious<CR> " disabled as this is the Esc combination

" switch between last two buffers (FYI)
" <C-^>

"" Run / compile / visualize
"-------------------------------------------------------------------------------

" inside vim

" edit this configuration file (requires set hidden)
nnoremap <F2> :e ~/.config/nvim/init.vim<CR>
inoremap <F2> <Esc>:e ~/.config/nvim/init.vim<CR>

" edit snippets
nnoremap <F6> :e ~/.scripts/dmenu/snippets.txt<CR>
inoremap <F6> <Esc>:e ~/.scripts/dmenu/snippets.txt<CR>

" enable spell checker:
nnoremap <F3> <Esc>:setlocal spell! spelllang=en_us<CR>
inoremap <F3> <Esc>:setlocal spell! spelllang=en_us<CR>
" use zg to add a word to the dictionary
" use zuw to remove word from dictionary
" use ]s and [s to navigate between misspelled words
" use z= to find a suggestion for the misspelled word

" execute last command
nnoremap <F4> <Esc>:<C-p><CR>
inoremap <F4> <Esc>:<C-p><CR>



" python

autocmd FileType python nnoremap <F6> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>
autocmd FileType python inoremap <F6> <Esc>:w<CR>:silent !~/.scripts/nvim/nvim_run %<CR>
autocmd FileType python vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>
autocmd FileType python nnoremap <F5> <Esc>:w<CR>:only<CR>:HT ipython -i %<CR>G
autocmd FileType python inoremap <F5> <Esc>:w<CR>:only<CR>:HT ipython -i %<CR>G
"autocmd FileType python inoremap <F5> <Esc>:w<CR>:only<CR>:HT ipython -i %<CR>G<C-w>k


" tex / latex / xelatex

autocmd FileType tex nnoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE.tex ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -f -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>:sleep 100m<cr>G:sleep 100m<cr><C-w>k:nnoremap j gj<cr>:nnoremap k gk<cr>:set wrap linebreak<cr>:sleep 200m<cr>:Goyo<cr>
autocmd FileType tex inoremap <F5> <Esc>:w<CR>:only<CR>:HT [ -f $TEXBASE.tex ] && latexmk -xelatex -cd -synctex=1 -interaction=nonstopmode -shell-escape $TEXBASE \|\| latexmk -f -xelatex -cd -synctex=1 -interaction=nonstopmode<CR>:sleep 100m<cr>G:sleep 100m<C-w>k:nnoremap j gj<cr>:nnoremap k gk<cr>:set wrap linebreak<cr>:sleep 200m<cr>:Goyo<cr>

" <Leader>s  --> latex synctex tex->pdf
function! SyncTex()
    " either do synctex on the pdf with basename [filename without extension] $TEXBASE,
    " or do synctex on the pdf with the same base name as the current tex file if
    " the environment variable $TEXBASE does not exist.
    exec "silent !test -z $TEXBASE && TEXBASE=%:p:r; zathura --synctex-editor-command 'nvr --servername ".v:servername." +\\%{line} \\%{input}' --synctex-forward ".line(".").":".col(".").":%:p $TEXBASE.pdf &"
endfunction
autocmd FileType tex nmap <Leader>s :call SyncTex()<CR>

" Ctrl-Click  --> latex synctex pdf->tex


" markdown

redir => neovim_server
silent echo v:servername
redir end
autocmd FileType markdown nnoremap <C-i> 0v$"*y:read !~/.scripts/nvim/nvim_markdown_image<CR>kddk
autocmd FileType markdown vnoremap <F5> "+y:silent !~/.scripts/nvim/nvim_run % SELECTION<CR>
autocmd BufWritePost *.md silent execute '!smdv 'expand('%:p')' -v "'.v:servername'"'
autocmd FileType markdown nnoremap <Leader>d "ayi(:execute ":edit ".@a<CR>:silent !smdv --sync %<CR>


"" Settings
"-------------------------------------------------------------------------------

" enable different behavior for different filetypes:
set nocompatible
filetype plugin on

" automatically cd into folder of current file
autocmd BufEnter * silent! lcd %:p:h

" underline current line if in insert mode
autocmd InsertEnter * set cul

" remove underline when in normal mode
autocmd InsertLeave * set nocul

" clear trailing spaces in python files at saving
autocmd BufWritePre *.py %s/\s\+$//e

" save on focus lost
au FocusLost * :wa

" enable syntax highlighting
syntax enable

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

" relative line numbering
set relativenumber

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
set scrolloff=10

" code folding
" zM: fold all; zR: unfold all; za: toggle fold, zv: unfold one; zc: fold one
set foldmethod=indent

" emmet html support
" set emmet triger key to ';'
let g:user_emmet_leader_key=';'
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" allow opening a new buffer without saving the current one
set hidden

" back to normal mode
inoremap jj <Esc>

" turn of code highlighting
nnoremap <leader><leader> :noh<cr>

" easier access to command mode
nnoremap ; :

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" insert snippet
nnoremap <leader>i :silent !dmenu_snippets<cr>"+p

" insert greek letter
nnoremap <C-g> :silent !dmenu_greek<cr>"+p
inoremap <C-g> <Esc>:silent !dmenu_greek<cr>"+p

" no help file
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"" Theme / colorscheme
"-------------------------------------------------------------------------------

" colorscheme desert2
colorscheme xresources

" use 256 colors when possible
" set notermguicolors
" set termguicolors
" highlight clear

" white colorscheme
" colorscheme delek

" dark colorscheme
" colorscheme material

" fisa colorscheme
" colorscheme fisa

