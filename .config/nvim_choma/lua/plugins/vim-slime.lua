-- Ref https://github.com/jpalardy/vim-slime
return {
    {
        "jpalardy/vim-slime",
        ft = { "python" },
        init = function()
            -- vim.g.python3_host_prog = '/home/choma/.local/share/guv/base/.venv/bin/python' -- we don't need this
            vim.g.slime_no_mappings = 1
            vim.g.slime_target = "neovim"
            vim.g.slime_python_ipython = 1
            vim.g.slime_cell_delimiter = "##"
            -- vim.g.slime_dont_ask_default = 1
            -- vim.g.slime_default_config = { 5 }
            vim.g.slime_suggest_default = 1

            -- it seems to related to terminal's paste, no use for me now because it messes up sometimes
            -- vim.g.slime_bracketed_paste = 1



            vim.g.ipython_cell_tag = { '# %%', '##[+=\\-*]', '```', '```python', '```py' }
            vim.g.ipython_cell_regex = 1
            vim.g.ipython_cell_highlight_cells = 1
        end
    },
    {
        "hanschen/vim-ipython-cell", -- system wise Tkinter is required
        ft = { "python" },
    },
}
