vim.filetype.add({
    extension = {
        ipynb = "ipynb",
    }
})
vim.filetype.add({
    extension = {
        vimrc = "vim",
        vifmrc = "vim",
    }
})
vim.filetype.add({
    extension = {
        tex = "tex",
        sty = "tex",
    }
})
vim.filetype.add({
    extension = {
        txt = "text"
    },
    pattern = {
        ["/tmp/neomutt*"] = "text",
    }
})
---------------------------------------------------------------
-- Example https://neovim.io/news/2022/04
-- vim.filetype.add({
--     extension = {
--         foo = "fooscript",
--     },
--     filename = {
--         ["Foofile"] = "fooscript",
--     },
--     pattern = {
--         ["~/%.config/foo/.*"] = "fooscript",
--     }
-- })
