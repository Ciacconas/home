local fn = vim.fn
local keymap = vim.api.nvim_set_keymap
local keymap_opt = { noremap = true, silent = true }

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
  augroup packer_user_config autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup({
	function(use)
		-- My plugins here
		-- Infrastructure
		use({ "wbthomason/packer.nvim", opt = false })
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
		use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({ "nvim-treesitter/playground" })
		use({ "akinsho/toggleterm.nvim" })

		-- Utility
		-- Easy motion in vim
		use({
			"phaazon/hop.nvim",
			branch = "v1",
			config = function()
				require("hop").setup({})
				vim.cmd([[nnoremap s :HopChar2<CR>]])
			end,
		})
		-- vim hard mode (useful for training)
		use({
			"takac/vim-hardtime",
			config = [[
				vim.g.hardtime_default_on = 1
				vim.g.hardtime_maxcount = 3
				vim.g.hardtime_allow_different_key = 1
        vim.g.list_of_normal_keys = {"j", "k", "h", "l"}
        vim.g.list_of_visual_keys = {"h", "l"}
        ]],
		})
		-- autopair with fly-mode support
		use({ "jiangmiao/auto-pairs", config = "vim.g.AutoPairsFlyMode = 0" })

		-- lsp related
		use({ "jose-elias-alvarez/null-ls.nvim", disable = false })

		-- python
		use({ "jpalardy/vim-slime", ft = { "python" } })
		use({ "hanschen/vim-ipython-cell", ft = { "python" } })

		use({ "tweekmonster/startuptime.vim" })
		-- use({ "justinmk/vim-sneak", disable = true })

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
