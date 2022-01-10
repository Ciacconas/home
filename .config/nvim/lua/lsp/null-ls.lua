-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/null-ls.lua
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

null_ls.setup({
	debug = false,
	sources = {
		-- stylua better than lua-format
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.black,
	},
})
