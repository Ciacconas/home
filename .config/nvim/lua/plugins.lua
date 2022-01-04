local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Autocommand that compile packer whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require("packer").startup({
	function(use)
		-- My plugins here
		-- Infrastructure
		use({ "wbthomason/packer.nvim", opt = false })
		use({ "nvim-lua/plenary.nvim" })

		-- vim hard mode (useful for training)
		use({
			"takac/vim-hardtime",
			opt = false,
			config = function()
				vim.g.hardtime_default_on = 0
			end,
		})

		-- quick inline navigation utilizing 'f'
		use({ "unblevable/quick-scope" })

		-- autopair with fly-mode support
		use({ "jiangmiao/auto-pairs", config = "vim.g.AutoPairsFlyMode = 1" })

		-- lsp related
		use({ "jose-elias-alvarez/null-ls.nvim", active = true })

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- floatwindow prompt for packer commands
	-- config = {
	-- 	display = {
	-- 		open_fn = function()
	-- 			return require("packer.util").float({ border = "rounded" })
	-- 		end,
	-- 	},
	-- },
})
