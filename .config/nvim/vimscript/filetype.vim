augroup LuaSettings
    autocmd!
    " format before save
    autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
    " no code folding for lua
    autocmd FileType lua setlocal foldmethod=manual
augroup end
