-- Heavily inspired by kickstart.nvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
    spec = { -- import your plugins
        {
            import = 'plugins',
        },
        {
            { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
            {
                'catppuccin/nvim',
                name = 'catppuccin',
                priority = 1000,
                config = function()
                    require('catppuccin').setup({
                        default_integrations = true,
                    })
                    vim.cmd.colorscheme('termcolor')
                    -- vim.cmd.colorscheme('catppuccin')

                    if vim.g.neovide then
                        vim.cmd.colorscheme('catppuccin')
                        -- vim.opt.guifont = 'FiraCode Nerd Font:h14'
                        vim.opt.guifont = 'UbuntuMono Nerd Font:h15'
                    end
                end,
            },
            { 'numToStr/Comment.nvim' }, -- "gc" to comment visual regions/lines
        },
    },
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    -- checker = { enabled = true },
})
