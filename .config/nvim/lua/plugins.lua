local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.hardtime_default_on = 0
return require('packer').startup({
    function(use)
        -- My plugins here
        use {'wbthomason/packer.nvim', opt = false}
        use {'tpope/vim-fugitive', opt = true}
        use {'posva/vim-vue', opt = true}

        -- vim hard mode (useful for training)
        use {
            'takac/vim-hardtime',
            opt = false,
            config = function() vim.g.hardtime_default_on = 0 end
        }

        -- quick inline navigation utilizing 'f'
        use {'unblevable/quick-scope'}

        -- lua formatting use call LuaFormat
        use {
            'andrejlevkovitch/vim-lua-format',
            config = function()
                vim.cmd([[
                augroup luasettings
                    autocmd!
                    " enable lua format
                    autocmd BufWrite *.lua call LuaFormat()
                augroup end
              ]])
            end
        }

        -- autopair with fly-mode support
        use {'jiangmiao/auto-pairs', config = 'vim.g.AutoPairsFlyMode = 1'}

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then require('packer').sync() end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({border = 'single'})
            end
        }
    }
})
