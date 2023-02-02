-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/null-ls.lua
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
null_ls.setup({
    debug = true,
    sources = { -- stylua better than lua-format
    formatting.stylua, formatting.black.with({
        extra_args = {"-t", "py38", "-l", "120"}
    }) -- formatting.gofmt,
    }
})

vim.keymap.set('n', '<leader>F', function()
    vim.lsp.buf.format({
        timeout_ms = 2000
    })
end)
