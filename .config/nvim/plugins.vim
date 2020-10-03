"    _____ _     ____  ____  ____  ____  _____
"   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
"   |  __\| |   | / \||  \/|| / \||  \/|  / \
"   | |   | |_/\| |-|||  __/| \_/||    /  | |
"   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/
"

"" Plugin installer
"-------------------------------------------------------------------------------

" From https://github.com/fisadev/fisa-nvim-config/blob/master/init.vim

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug...\n"
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


"" Plugins
"-------------------------------------------------------------------------------

" Run :PlugInstall to install extra packages after adding them to the list below
" Run :UpdateRemotePlugins to update dependencies

call plug#begin('~/.config/nvim/plugged') " start loading plugins
Plug 'anntzer/vim-cython' " cython syntax highlighting
Plug 'christoomey/vim-tmux-navigator' " tmux navigation
Plug 'hanschen/vim-ipython-cell' " better integration with ipython (requires slime)
Plug 'jpalardy/vim-slime' " better integration between text and terminal buffers
Plug 'jremmen/vim-ripgrep' " better grep command for vim
Plug 'junegunn/fzf.vim' " fuzzy file finder (needs system wide fzf install)
Plug 'junegunn/goyo.vim', " distraction free writing.
Plug 'kshenoy/vim-signature' " show marks in margin
Plug 'lilydjwg/colorizer' " paint css colors with the real color
Plug 'mbbill/undotree' " undo tree for vim
Plug 'mhinz/vim-signify' " git/mercurial/others diff icons on the side of the file lines
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/context_filetype.vim' " completion from other opened files
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'szymonmaszke/vimpyter' " edit jupyter notebooks
Plug 'tpope/vim-commentary' " easy comment
Plug 'tpope/vim-markdown' " markdown syntax highlighting
Plug 'tpope/vim-repeat' " easily repeat plugin commands with .
Plug 'tpope/vim-speeddating' " increase date with <C-A>
Plug 'tpope/vim-surround' " easily surround word with quotes or tags
Plug 'valloric/MatchTagAlways' " highlight matching html tags
Plug 'vim-airline/vim-airline' " better status bar
Plug 'vim-utils/vim-man' " man pages in vim
Plug 'voldikss/vim-floaterm' " floating terminal
Plug 'wikitopian/hardmode' " vim hard mode (useful for training)
call plug#end() " stop loading plugins


"" Install Plugins
"-------------------------------------------------------------------------------

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


"" Plugin Settings
"-------------------------------------------------------------------------------
" Plugin settings are defined here. Keyboard shortcuts are defined in init.vim.


" hanschen/vim-ipython-cell ----------------------

let g:ipython_cell_tag = ['##+', '```', '```python', '```py']
let g:ipython_cell_regex=1


" jpalardy/vim-slime -----------------------------

let g:slime_no_mappings = 1
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "##"
let g:slime_paste_file = "$HOME/.config/nvim/slime_paste"
let g:slime_default_config = [5]


" jremmen/vim-ripgrep ----------------------------

" only use ripgrep if it is available
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    let g:rg_derive_root='true'
endif


" lilydjwg/colorizer -----------------------------

" do not color more than 100 lines at once
let g:colorizer_maxlines = 100


" mhinz/vim-signify ------------------------------

" disable vim signify by default...
let g:signify_disable_by_default = 1


" neoclide/coc.nvim ------------------------------

source ~/.config/nvim/coc-settings.vim


" Shougo/context_filetype.vim --------------------

" complete with words from any opened file
let g:context_filetype#same_filetypes = {}

" set underscore
let g:context_filetype#same_filetypes._ = '_'


" suan/vim-instant-markdown ----------------------

" always run on port 9876
let g:instant_markdown_port = 9876
" do not start when opening markdown file
let g:instant_markdown_autostart = 0
" obviously, enable markdown autoscroll
let g:instant_markdown_autoscroll = 1
" don't use the python server (requires npm package: `npm -g install instant-markdown-d`)
let g:instant_markdown_python = 0
" use custom webapp script to open browser:
let g:instant_markdown_browser = "webapp -f"


" tpope/vim-markdown -----------------------------

" inline code highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
" conceal markdown syntax
let g:markdown_syntax_conceal = 1
" highlight 100 lines
let g:markdown_minlines = 100


" vim airline ------------------------------------

" enable powerline fonts for vim airline
let g:airline_powerline_fonts = 1
" let g:airline_theme="base16_gruvbox_dark_hard"
let g:airline_theme="xresources_airline"

