function SetColors()
  -- local color = color or 'rose-pine'
  -- vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'cterm0', { ctermfg = 0 })
  vim.api.nvim_set_hl(0, 'cterm1', { ctermfg = 1 })
  vim.api.nvim_set_hl(0, 'cterm2', { ctermfg = 2 })
  vim.api.nvim_set_hl(0, 'cterm3', { ctermfg = 3 })
  vim.api.nvim_set_hl(0, 'cterm4', { ctermfg = 4 })
  vim.api.nvim_set_hl(0, 'cterm5', { ctermfg = 5 })
  vim.api.nvim_set_hl(0, 'cterm6', { ctermfg = 6 })
  vim.api.nvim_set_hl(0, 'cterm7', { ctermfg = 7 })
  vim.api.nvim_set_hl(0, 'cterm8', { ctermfg = 8 })
  vim.api.nvim_set_hl(0, 'cterm9', { ctermfg = 9 })
  vim.api.nvim_set_hl(0, 'cterm10', { ctermfg = 10 })
  vim.api.nvim_set_hl(0, 'cterm11', { ctermfg = 11 })
  vim.api.nvim_set_hl(0, 'cterm12', { ctermfg = 12 })
  vim.api.nvim_set_hl(0, 'cterm13', { ctermfg = 13 })
  vim.api.nvim_set_hl(0, 'cterm14', { ctermfg = 14 })
  vim.api.nvim_set_hl(0, 'cterm15', { ctermfg = 15 })

  vim.api.nvim_set_hl(0, 'cterm0bold', { ctermfg = 0, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm1bold', { ctermfg = 1, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm2bold', { ctermfg = 2, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm3bold', { ctermfg = 3, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm4bold', { ctermfg = 4, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm5bold', { ctermfg = 5, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm6bold', { ctermfg = 6, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm7bold', { ctermfg = 7, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm8bold', { ctermfg = 8, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm9bold', { ctermfg = 9, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm10bold', { ctermfg = 10, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm11bold', { ctermfg = 11, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm12bold', { ctermfg = 12, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm13bold', { ctermfg = 13, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm14bold', { ctermfg = 14, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'cterm15bold', { ctermfg = 15, cterm = { bold = true } })

  vim.api.nvim_set_hl(0, 'cterm0italic', { ctermfg = 0, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm1italic', { ctermfg = 1, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm2italic', { ctermfg = 2, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm3italic', { ctermfg = 3, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm4italic', { ctermfg = 4, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm5italic', { ctermfg = 5, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm6italic', { ctermfg = 6, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm7italic', { ctermfg = 7, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm8italic', { ctermfg = 8, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm9italic', { ctermfg = 9, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm10italic', { ctermfg = 10, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm11italic', { ctermfg = 11, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm12italic', { ctermfg = 12, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm13italic', { ctermfg = 13, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm14italic', { ctermfg = 14, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'cterm15italic', { ctermfg = 15, cterm = { italic = true } })

  -- for treesitter code highlight
  vim.api.nvim_set_hl(0, '@number', { link = 'cterm11' })
  vim.api.nvim_set_hl(0, '@comment', { link = 'cterm7' })
  vim.api.nvim_set_hl(0, '@variable', { link = 'cterm15' })
  vim.api.nvim_set_hl(0, '@variable.member', { link = 'cterm13' })
  vim.api.nvim_set_hl(0, '@string', { link = 'cterm10' })
  vim.api.nvim_set_hl(0, '@function.call', { link = 'cterm12' })
  vim.api.nvim_set_hl(0, '@keyword', { link = 'cterm5bold' })

  -- autocomplete menu
  vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 0, ctermbg = 15 })

  -- highlight under cursor
  vim.api.nvim_set_hl(0, 'Visual', { ctermfg = 15, ctermbg = 8 })

  -- vim.api.nvim_set_hl(0, '@variable.member', { link = 'cterm0' })

  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- -- TreeSitter
  -- -- hi Function cterm=bold ctermfg=13 " TSFunction TSMethod
  -- vim.api.nvim_set_hl(0, 'Special', { ctermfg = 5 })
  -- -- vim.api.nvim_set_hl(0, "TSKeywordFunction", { cterm = {bold=true}, ctermfg = 14 })
  -- -- vim.api.nvim_set_hl(0, "link", { TSKeywordReturn TSKeywordFunction})
  -- vim.api.nvim_set_hl(0, 'PreProc', { ctermfg = 6 })
  -- vim.api.nvim_set_hl(0, 'Constant', { ctermfg = 10 })
  -- vim.api.nvim_set_hl(0, 'Identifier', { cterm = {}, ctermfg = 12 })
  -- vim.api.nvim_set_hl(0, 'Type', { cterm = { italic = true }, ctermfg = 4 })
  -- vim.api.nvim_set_hl(0, 'Statement', { cterm = { bold = true }, ctermfg = 11 })
  -- vim.api.nvim_set_hl(0, 'Delimiter', { cterm = { bold = true }, ctermfg = 7 })

  -- -- QuickScope
  -- vim.api.nvim_set_hl(0, 'QuickScopePrimary', { cterm = { bold = true }, ctermfg = 4 })

  -- -- TUI
  -- vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 7, ctermbg = 8 })
  -- vim.api.nvim_set_hl(0, 'Search', { cterm = {}, ctermfg = 15, ctermbg = 6 })
  -- vim.api.nvim_set_hl(0, 'IncSearch', { cterm = { bold = true }, ctermfg = 15, ctermbg = 6 })
  -- vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 4 })
  -- vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 4 })
  -- vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 5 })
  -- vim.api.nvim_set_hl(0, 'DiffDelete', { cterm = { bold = true }, ctermfg = 4, ctermbg = 6 })
  -- vim.api.nvim_set_hl(0, 'DiffText', { cterm = { bold = true }, ctermbg = 9 })
  -- vim.api.nvim_set_hl(0, 'Directory', { ctermfg = 6 })
  -- vim.api.nvim_set_hl(0, 'Error', { cterm = { bold = true }, ctermfg = 1, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'ErrorMsg', { cterm = { bold = true }, ctermfg = 15, ctermbg = 9 })
  -- vim.api.nvim_set_hl(0, 'FoldColumn', { ctermfg = 8, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Folded', { ctermfg = 'none', ctermbg = 8 })
  -- vim.api.nvim_set_hl(0, 'Ignore', { ctermfg = 8 })
  -- vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 3 })
  -- vim.api.nvim_set_hl(0, 'MatchParen', { cterm = {}, ctermfg = 3 })
  -- vim.api.nvim_set_hl(0, 'ModeMsg', { cterm = {}, ctermfg = 1 })
  -- vim.api.nvim_set_hl(0, 'MoreMsg', { ctermfg = 2 })
  -- vim.api.nvim_set_hl(0, 'NonText', { cterm = { bold = true }, ctermfg = 4 })
  -- vim.api.nvim_set_hl(0, 'Question', { ctermfg = 2 })
  -- vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'SpecialKey', { ctermfg = 2 })
  -- vim.api.nvim_set_hl(0, 'SpellBad', { cterm = { bold = true }, ctermfg = 9, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'SpellCap', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'SpellErrors', { cterm = { underline = true }, ctermfg = 1, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'SpellLocal', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'SpellRare', { cterm = { underline = true }, ctermfg = 9, ctermbg = 'none' })
  -- vim.api.nvim_set_hl(0, 'StatusLine', { cterm = { bold = true, reverse = true } })
  -- vim.api.nvim_set_hl(0, 'StatusLineNC', { cterm = { reverse = true } })
  -- vim.api.nvim_set_hl(0, 'Title', { cterm = { bold = true }, ctermfg = 10 })
  -- vim.api.nvim_set_hl(0, 'Todo', { ctermfg = 7, ctermbg = 2 })
  -- vim.api.nvim_set_hl(0, 'Underlined', { cterm = { underline = true }, ctermfg = 12 })
  -- vim.api.nvim_set_hl(0, 'VertSplit', { cterm = {}, ctermbg = 'none' })
  -- -- vim.api.nvim_set_hl(0, "Visual", { cterm = reverse })
  -- vim.api.nvim_set_hl(0, 'Warning', { ctermfg = 7, ctermbg = 3 })
  -- vim.api.nvim_set_hl(0, 'WarningMsg', { ctermfg = 15, ctermbg = 3 })
  -- vim.api.nvim_set_hl(0, 'WildMenu', { ctermfg = 0, ctermbg = 3 })
end

if vim.g.neovide then
  -- -- use gui colors by neovide default to be dark since it looks good during night
  vim.opt.termguicolors = true
  vim.opt.background = 'dark'
  -- vim.cmd([[colorscheme melange]])
  vim.cmd.colorscheme 'catppuccin'
  -- vim.opt.guifont = 'FiraCode Nerd Font:h14'
  vim.opt.guifont = 'UbuntuMono Nerd Font:h15'

  -- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'NormalFloat' })
  -- vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'NormalFloat' })
  -- vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'NormalFloat' })
  -- -- use light scheme during the day
  -- local t = os.date("*t")
  -- local hour = t.hour
  -- if (hour < 22) and (hour > 6) then
  --     vim.opt.background = "light"
  --     -- vim.cmd([[colorscheme dayfox]])
  -- end
else
  -- use 256 colors if possible
  -- print("runing the color script")

  vim.opt.background = 'dark'
  vim.opt.termguicolors = false
  -- -- custom colorscheme using only colors from ~/.Xresources.
  SetColors()
end
