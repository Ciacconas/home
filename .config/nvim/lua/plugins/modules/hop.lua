return {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup({})
            vim.cmd([[nnoremap s <cmd>HopChar2<CR>]])
        end,
    }