return {
    'mason-org/mason-lspconfig.nvim',
    -- install lsp server and selectively auto-enable them
    opts = {
        ensure_installed = {
            'lua_ls',
            -- 'pyright',
        },
        -- automatic_enable = {
        --     'lua_ls',
        -- },
    },
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        -- "neovim/nvim-lspconfig", -- this is no longer needed and is causing issues
        {
            -- install other lsp related tools that are not lsp servers
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            opts = {
                ensure_installed = {
                    'stylua',
                    'ruff',
                },
            },
        },
        {
            'folke/lazydev.nvim', -- for lua lsp configuring
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },
    },
}
