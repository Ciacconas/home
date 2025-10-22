return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    -- ref: https://docs.astral.sh/ruff/editors/settings
    init_options = {
        settings = {
            showSyntaxErrors = false, -- disable for pyright to show syntax errors
            lint = {
                enable = false -- disable for pyright to show lint infos
            },
        },
    },
    on_attach = function(client, bufnr)
        vim.schedule(function()
            print 'ruff attached'
        end)
    end,
}
