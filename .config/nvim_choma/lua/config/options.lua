local options = {
    -- basic settings
    number = true,                           -- set numbered lines
    breakindent = true,                      -- wrap lines with indent
    relativenumber = false,                  -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    scrolloff = 8,                           -- Makes sure there are always eight lines of context
    sidescrolloff = 8,                       -- Makes sure there are always eight lines of contextoption
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    showtabline = 0,                         -- always show tabs, this is ok with the tab plugin
    laststatus = 3,                          -- Always display the status line
    expandtab = true,                        -- convert tabs to spaces
    tabstop = 2,                             -- insert 2 spaces for a tab
    softtabstop = 2,                         -- set tabs to have a maximum width of 2 spaces
    shiftwidth = 2,                          -- the number of spaces inserted for each indentation
    smartindent = false,                     -- make indenting smarter again
    hlsearch = true,                         -- highlight all matches on previous search pattern
    incsearch = true,                        -- make search matches as you type
    -- termguicolors = true,                    -- set term gui colors (most terminals support this), we need this
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    showmatch=true,                          -- hightlights match brackets
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore, we've got status line
    pumheight = 10,                          -- pop up menu height

    foldcolumn = "2",                          -- left margin width (max 12)

    autoindent = false,                      -- disable automatic indent when moving to the next line while writing code

    spell = false,                           -- spell check, set default to en_us...
    spelllang = "en_us",

    backup = false,                          -- creates a backup file
    undofile = true,                         -- enable persistent undo
    autoread = true,                         -- auto update the file changed outside of neovim
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    ignorecase = true,                       -- ignore case in search patterns

    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    mouse = "a",                             -- allow the mouse to be used in neovim
    smartcase = true,                        -- smart case
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 100,                        -- faster completion (4000ms default)
    cursorline = false,                      -- highlight the current line
    wrap = false,                            -- display lines as one long line
    linebreak = false,
    formatoptions = "lqj",
    textwidth = 0,
    colorcolumn = "0",
    showcmd = false,                         -- don't show last command executed
    ruler = true,                           -- show where you are in the document in status bar (e.g. 143,61, 20%)
    -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
    title = true,                            -- set the title of window to the value of the titlestring
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.clipboard = vim.opt.clipboard:prepend({"unnamed", "unnamedplus"}) --unnamed is the middle mouse paste, unnamed plus is the <C-V>. in macos they are the same
