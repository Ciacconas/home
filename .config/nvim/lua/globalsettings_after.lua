-- Miscillenius settings that should run at the end

---------------------------------------------------------------------
-- settings

-- -- custom colorscheme using only colors from ~/.Xresources.
vim.cmd([[colorscheme xresources]])

-- -- override some colors of colorscheme
vim.cmd([[hi FoldColumn ctermbg=NONE]])

---------------------------------------------------------------------
-- auto groups

--underline current line if in insert mode
local insert_underline = vim.api.nvim_create_augroup("fixed_setting", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", { group = insert_underline, command = "set cul" })
vim.api.nvim_create_autocmd("InsertLeave", { group = insert_underline, command = "set nocul" })

-- TODO:
-- " disable automatic commenting on newline:
-- " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

























-- Run python in the neovim toggleterm terminal
function PythonRun(type)
    if vim.g.last_terminal_job_id ~= nil then
        vim.b.slime_config = { vim.g.last_terminal_job_id }
        if type == "celljump" then
            vim.cmd('IPythonCellExecuteCellJump')
        end
        if type == "runall" then
            vim.cmd('IPythonCellRunTime')
        end
    else
        vim.cmd([[call system('ipython -c "import sys"')]])
        print('not exist')
        if vim.v.shell_error == 0 then
            _IPYTHON_TERM()
            -- vim.wait(800)
            -- PythonRun(type)
        else
            print("ipython not found")
        end
    end
end

-- keymaps
local function set_python_related_keymaps()
    vim.keymap.set("n", "<CR>", function() PythonRun('celljump') end, { buffer = true })
    vim.keymap.set("n", "<F5>", function() PythonRun('runall') end, { buffer = true })
    vim.keymap.set("n", "<leader>\\", function() _IPYTHON_TERM() end, { buffer = true })
end

-- setting up the au group for the python filetype specific keymaps
vim.api.nvim_create_augroup("custom_filetype_python", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    group = "custom_filetype_python",
    callback = set_python_related_keymaps
})
