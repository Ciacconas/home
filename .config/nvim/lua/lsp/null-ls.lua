-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/null-ls.lua
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
null_ls.setup({
	debug = false,
	sources = {
		-- stylua better than lua-format
		formatting.builtins.formatting.stylua,
		formatting.builtins.formatting.black,
	},
})

vim.cmd([[ command! LSPFormat execute 'lua vim.lsp.buf.formatting()' ]])
