-- Ref https://github.com/jpalardy/vim-slime
return {
    {
        "jpalardy/vim-slime",
        ft = { "python" },
        init = function()
            -- vim.g.python3_host_prog = '/usr/bin/python'
            vim.g.slime_no_mappings = 1
            vim.g.slime_target = "neovim"
            vim.g.slime_python_ipython = 1
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_cell_delimiter = "##"
            -- vim.g.slime_default_config = { 5 }
            vim.g.slime_suggest_default = 1

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
