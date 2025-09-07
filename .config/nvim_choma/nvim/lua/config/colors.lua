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

    vim.api.nvim_set_hl(0, 'cterm0bold', { ctermfg = 0, bold = true })
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

    ---------------------------------------

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

function SetTermColors()
    vim.cmd([[
        set background=dark

        hi clear

        let g:colors_name = 'ansi'
        set notermguicolors

        " This color scheme relies on ANSI colors only. It automatically inherits
        " the 16 colors of your terminal color scheme. You can change the colors of
        " certain highlight groups by picking a different color from the following set
        " of colors. If you sticked to the ANSI color palette conventions when setting
        " colors in your terminal emulator, this will look pretty neat. If you used
        " a terminal color scheme that uses a different convention (e.g. base16)
        " colors will likely look very odd if you use this color scheme.
        "
        " 0: Black        │   8: Bright Black (dark gray)
        " 1: Red          │   9: Bright Red
        " 2: Green        │  10: Bright Green
        " 3: Yellow       │  11: Bright Yellow
        " 4: Blue         │  12: Bright Blue
        " 5: Magenta      │  13: Bright Magenta
        " 6: Cyan         │  14: Bright Cyan
        " 7: White (gray) │  15: Bright White
        "
        " Use the 'cterm' argument to make certain highlight groups appear in italic
        " (if your terminal and font support it), bold, reverse, underlined, etc.
        " See ':help attr-list' for possible options.

        " Editor Elements
        hi NonText ctermfg=0
        hi Ignore ctermfg=NONE  ctermbg=NONE cterm=NONE
        hi Underlined cterm=underline
        hi Bold cterm=bold
        hi Italic cterm=italic
        hi StatusLine ctermfg=15 ctermbg=8 cterm=NONE
        hi StatusLineNC ctermfg=15 ctermbg=0 cterm=NONE
        hi VertSplit ctermfg=8
        hi TabLine ctermfg=7 ctermbg=0
        hi TabLineFill ctermfg=0 ctermbg=NONE
        hi TabLineSel ctermfg=0 ctermbg=11
        hi Title ctermfg=4 cterm=bold
        hi CursorLine ctermbg=0 ctermfg=NONE
        hi Cursor ctermbg=15 ctermfg=0
        hi CursorColumn ctermbg=0
        hi LineNr ctermfg=8
        hi CursorLineNr ctermfg=6
        hi helpLeadBlank ctermbg=NONE ctermfg=NONE
        hi helpNormal ctermbg=NONE ctermfg=NONE
        hi Visual ctermbg=8 ctermfg=15 cterm=bold
        hi VisualNOS ctermbg=8 ctermfg=15 cterm=bold
        hi Pmenu ctermbg=7 ctermfg=8
        hi PmenuSbar ctermbg=8 ctermfg=7
        hi PmenuSel ctermbg=8 ctermfg=15 cterm=bold
        hi PmenuThumb ctermbg=7 ctermfg=NONE
        hi FoldColumn ctermfg=7
        hi Folded ctermfg=12
        hi WildMenu ctermbg=0 ctermfg=15 cterm=NONE
        hi SpecialKey ctermfg=0
        hi IncSearch ctermbg=1 ctermfg=0
        hi CurSearch ctermbg=3 ctermfg=0
        hi Search ctermbg=11 ctermfg=0
        hi Directory ctermfg=4
        hi MatchParen ctermbg=0 ctermfg=3 cterm=underline
        hi SpellBad cterm=undercurl
        hi SpellCap cterm=undercurl
        hi SpellLocal cterm=undercurl
        hi SpellRare cterm=undercurl
        hi ColorColumn ctermbg=8
        hi SignColumn ctermfg=7
        hi ModeMsg ctermbg=15 ctermfg=0 cterm=bold
        hi MoreMsg ctermfg=4
        hi Question ctermfg=4
        hi QuickFixLine ctermbg=0 ctermfg=14
        hi Conceal ctermfg=8
        hi ToolbarLine ctermbg=0 ctermfg=15
        hi ToolbarButton ctermbg=8 ctermfg=15
        hi debugPC ctermfg=7
        hi debugBreakpoint ctermfg=8
        hi ErrorMsg ctermfg=1 cterm=bold,italic
        hi WarningMsg ctermfg=11
        hi DiffAdd ctermbg=10 ctermfg=0
        hi DiffChange ctermbg=12 ctermfg=0
        hi DiffDelete ctermbg=9 ctermfg=0
        hi DiffText ctermbg=14 ctermfg=0
        hi diffAdded ctermfg=10
        hi diffRemoved ctermfg=9
        hi diffChanged ctermfg=12
        hi diffOldFile ctermfg=11
        hi diffNewFile ctermfg=13
        hi diffFile ctermfg=12
        hi diffLine ctermfg=7
        hi diffIndexLine ctermfg=14
        hi healthError ctermfg=1
        hi healthSuccess ctermfg=2
        hi healthWarning ctermfg=3

        " Syntax
        hi Comment ctermfg=8 cterm=italic
        hi Constant ctermfg=3
        hi Error ctermfg=1
        hi Identifier ctermfg=9
        hi Function ctermfg=4
        hi Special ctermfg=13
        hi Statement ctermfg=5
        hi String ctermfg=2
        hi Operator ctermfg=6
        hi Boolean ctermfg=3
        hi Label ctermfg=14
        hi Keyword ctermfg=5
        hi Exception ctermfg=5
        hi Conditional ctermfg=5
        hi PreProc ctermfg=13
        hi Include ctermfg=5
        hi Macro ctermfg=5
        hi StorageClass ctermfg=11
        hi Structure ctermfg=11
        hi Todo ctermfg=0 ctermbg=9 cterm=bold
        hi Type ctermfg=11

        " neovim-specific (remove if you're using vim)
        hi NormalFloat ctermbg=0 ctermfg=15
        hi FloatBorder ctermbg=0 ctermfg=7
        hi FloatShadow ctermbg=0 ctermfg=15

        " Treesitter highlighting
        " - allows for more precise syntax highlighting
        " - only available for nvim >0.5
        " - see also :help treesitter-highlight-groups

        hi @variable ctermfg=15
        hi @variable.builtin ctermfg=1
        hi @variable.parameter ctermfg=1
        hi @variable.member ctermfg=1
        hi @constant.builtin ctermfg=5
        hi @string.regexp ctermfg=1
        hi @string.escape ctermfg=6
        hi @string.special.url ctermfg=4 cterm=underline
        hi @string.special.symbol ctermfg=13
        hi @type.builtin ctermfg=3
        hi @property ctermfg=1
        hi @function.builtin ctermfg=5
        hi @constructor ctermfg=11
        hi @keyword.coroutine ctermfg=1
        hi @keyword.function ctermfg=5
        hi @keyword.return ctermfg=5
        hi @keyword.export ctermfg=14
        hi @punctuation.bracket ctermfg=15
        hi @comment.error ctermbg=9 ctermfg=0
        hi @comment.warning ctermbg=11 ctermfg=0
        hi @comment.todo ctermbg=12 ctermfg=0
        hi @comment.note ctermbg=14 ctermfg=0
        hi @markup ctermfg=15
        hi @markup.strong ctermfg=15 cterm=bold
        hi @markup.italic ctermfg=15 cterm=italic
        hi @markup.strikethrough ctermfg=15 cterm=strikethrough
        hi @markup.heading ctermfg=4 cterm=bold
        hi @markup.quote ctermfg=6
        hi @markup.math ctermfg=4
        hi @markup.link.url ctermfg=5 cterm=underline
        hi @markup.raw ctermfg=14
        hi @markup.list.checked ctermfg=2
        hi @markup.list.unchecked ctermfg=7
        hi @tag ctermfg=5
        hi @tag.builtin ctermfg=6
        hi @tag.attribute ctermfg=4
        hi @tag.delimiter ctermfg=15

        hi link @variable.parameter.builtin @variable.parameter
        hi link @constant Constant
        hi link @constant.macro Macro
        hi link @module Structure
        hi link @module.builtin Special
        hi link @label Label
        hi link @string String
        hi link @string.special Special
        hi link @character Character
        hi link @character.special SpecialChar
        hi link @boolean Boolean
        hi link @number Number
        hi link @number.float Float
        hi link @type Type
        hi link @type.definition Type
        hi link @attribute Constant
        hi link @attribute.builtin Constant
        hi link @function Function
        hi link @function.call Function
        hi link @function.method Function
        hi link @function.method.call Function
        hi link @operator Operator
        hi link @keyword Keyword
        hi link @keyword.operator Operator
        hi link @keyword.import Include
        hi link @keyword.type Keyword
        hi link @keyword.modifier Keyword
        hi link @keyword.repeat Repeat
        hi link @keyword.debug Exception
        hi link @keyword.exception Exception
        hi link @keyword.conditional Conditional
        hi link @keyword.conditional.ternary Operator
        hi link @keyword.directive PreProc
        hi link @keyword.directive.define Define
        hi link @punctuation.delimiter Delimiter
        hi link @punctuation.special Special
        hi link @comment Comment
        hi link @comment.documentation Comment
        hi link @markup.underline underline
        hi link @markup.link Tag
        hi link @markup.link.label Label
        hi link @markup.list Special
        hi link @diff.plus diffAdded
        hi link @diff.minus diffRemoved
        hi link @diff.delta diffChanged

    ]])
end

-- if vim.g.neovide then
--     -- -- use gui colors by neovide default to be dark since it looks good during night
--     vim.opt.background = 'dark'
--     -- vim.cmd([[colorscheme melange]])
--     vim.cmd.colorscheme('catppuccin')
--     -- vim.opt.guifont = 'FiraCode Nerd Font:h14'
--     vim.opt.guifont = 'UbuntuMono Nerd Font:h15'
--
-- -- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'NormalFloat' })
-- -- vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'NormalFloat' })
-- -- vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'NormalFloat' })
-- -- -- use light scheme during the day
-- -- local t = os.date("*t")
-- -- local hour = t.hour
-- -- if (hour < 22) and (hour > 6) then
-- --     vim.opt.background = "light"
-- --     -- vim.cmd([[colorscheme dayfox]])
-- -- end
-- else
--     -- use 256 colors if possible
--     -- print("runing the color script")
--
--     -- vim.opt.background = 'dark'
--     -- vim.cmd.colorscheme('catppuccin')
--
--     -- custom colorscheme using only colors from ~/.Xresources.
--     -- vim.opt.termguicolors = false -- when using xresources colorscheme
--     SetTermColors() -- when using xresources colorscheme
-- end
