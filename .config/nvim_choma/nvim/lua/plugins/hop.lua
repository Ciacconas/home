return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    config = function()
        require("hop").setup({})
        vim.cmd([[nnoremap s <cmd>HopChar2<CR>]])
    end,
}