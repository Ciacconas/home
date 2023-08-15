function SetColors()
    -- local color = color or 'rose-pine'
    -- vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

    -- TreeSitter
    -- hi Function cterm=bold ctermfg=13 " TSFunction TSMethod
    vim.api.nvim_set_hl(0, 'Special', { ctermfg = 5 })
    -- vim.api.nvim_set_hl(0, "TSKeywordFunction", { cterm = {bold=true}, ctermfg = 14 })
    -- vim.api.nvim_set_hl(0, "link", { TSKeywordReturn TSKeywordFunction})
    vim.api.nvim_set_hl(0, 'PreProc', { ctermfg = 6 })
    vim.api.nvim_set_hl(0, 'Constant', { ctermfg = 10 })
    vim.api.nvim_set_hl(0, 'Identifier', { cterm = {}, ctermfg = 12 })
    vim.api.nvim_set_hl(0, 'Type', { cterm = { italic = true }, ctermfg = 4 })
    vim.api.nvim_set_hl(0, 'Statement', { cterm = { bold = true }, ctermfg = 11 })
    vim.api.nvim_set_hl(0, 'Delimiter', { cterm = { bold = true }, ctermfg = 7 })

    -- QuickScope
    vim.api.nvim_set_hl(0, 'QuickScopePrimary', { cterm = { bold = true }, ctermfg = 4 })

    -- TUI
    vim.api.nvim_set_hl(0, 'Search', { cterm = {}, ctermfg = 15, ctermbg = 6 })
    vim.api.nvim_set_hl(0, 'IncSearch', { cterm = { bold = true }, ctermfg = 15, ctermbg = 6 })
    vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 4 })
    vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 4 })
    vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 5 })
    vim.api.nvim_set_hl(0, 'DiffDelete', { cterm = { bold = true }, ctermfg = 4, ctermbg = 6 })
    vim.api.nvim_set_hl(0, 'DiffText', { cterm = { bold = true }, ctermbg = 9 })
    vim.api.nvim_set_hl(0, 'Directory', { ctermfg = 6 })
    vim.api.nvim_set_hl(0, 'Error', { cterm = { bold = true }, ctermfg = 1, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'ErrorMsg', { cterm = { bold = true }, ctermfg = 15, ctermbg = 9 })
    vim.api.nvim_set_hl(0, 'FoldColumn', { ctermfg = 8, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { ctermfg = 'none', ctermbg = 8 })
    vim.api.nvim_set_hl(0, 'Ignore', { ctermfg = 8 })
    vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 3 })
    vim.api.nvim_set_hl(0, 'MatchParen', { cterm = {}, ctermfg = 3 })
    vim.api.nvim_set_hl(0, 'ModeMsg', { cterm = {}, ctermfg = 1 })
    vim.api.nvim_set_hl(0, 'MoreMsg', { ctermfg = 2 })
    vim.api.nvim_set_hl(0, 'NonText', { cterm = { bold = true }, ctermfg = 4 })
    vim.api.nvim_set_hl(0, 'Question', { ctermfg = 2 })
    vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'SpecialKey', { ctermfg = 2 })
    vim.api.nvim_set_hl(0, 'SpellBad', { cterm = { bold = true }, ctermfg = 9, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'SpellCap', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'SpellErrors', { cterm = { underline = true }, ctermfg = 1, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'SpellLocal', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'SpellRare', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
    vim.api.nvim_set_hl(0, 'StatusLine', { cterm = { bold = true, reverse = true } })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { cterm = {reverse=true} })
    vim.api.nvim_set_hl(0, 'Title', { cterm = {bold=true}, ctermfg = 10 })
    vim.api.nvim_set_hl(0, 'Todo', { ctermfg = 7, ctermbg = 2 })
    vim.api.nvim_set_hl(0, 'Underlined', { cterm = {underline=true}, ctermfg = 12 })
    vim.api.nvim_set_hl(0, 'VertSplit', { cterm = {}, ctermbg = "none" })
    -- vim.api.nvim_set_hl(0, "Visual", { cterm = reverse })
    vim.api.nvim_set_hl(0, 'Warning', { ctermfg = 7, ctermbg = 3 })
    vim.api.nvim_set_hl(0, 'WarningMsg', { ctermfg = 15, ctermbg = 3 })
    vim.api.nvim_set_hl(0, 'WildMenu', { ctermfg = 0, ctermbg = 3 })
end

if vim.g.neovide then
    -- use gui colors by neovide default to be dark since it looks good during night
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    -- vim.cmd([[colorscheme melange]])
    vim.cmd.colorscheme 'melange'
    vim.opt.guifont = 'Hack Nerd Font Mono:h14'

-- -- use light scheme during the day
-- local t = os.date("*t")
-- local hour = t.hour
-- if (hour < 22) and (hour > 6) then
--     vim.opt.background = "light"
--     -- vim.cmd([[colorscheme dayfox]])
-- end
else
    -- use 256 colors if possible
    vim.opt.termguicolors = false
    -- -- custom colorscheme using only colors from ~/.Xresources.
    SetColors()
end
