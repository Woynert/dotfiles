local p = {
    base00 = '#222324',
    base01 = '#3a475e',
    base02 = '#3a475e',
    base03 = '#808080',
    base04 = '#888888',
    base05 = '#bababa',
    base06 = '#eff69c',
    base07 = '#fcffaa',
    base08 = '#bababa',
    base09 = '#E8341C',
    base0A = '#68C256',
    base0B = '#F2D42C',
    base0C = '#bababa',
    base0D = '#1C98E8',
    --base0E = '#bababa',
    --base0E = '#E8341C',
    base0E = '#8E69C9',
    base0F = '#68C256',
}
local pext = {
    tabline01 = p.base01,
    --tabline01 = '#585858',
}
require('mini.base16').setup {
    palette = p,
    use_cterm = true,
    plugins = {
        default = true,
        --['echasnovski/mini.nvim'] = false,
    },
}

--base00 - Default Background █
--base01 - Lighter Background (Used for status bars, line number and folding marks)
--base02 - Selection Background
--base03 - Comments, Invisibles, Line Highlighting
--base04 - Dark Foreground (Used for status bars)
--base05 - Default Foreground, Caret, Delimiters, Operators
--base06 - Light Foreground (Not often used)
--base07 - Light Background (Not often used)
--base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
--base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
--base0A - Classes, Markup Bold, Search Text Background
--base0B - Strings, Inherited Class, Markup Code, Diff Inserted
--base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
--base0D - Functions, Methods, Attribute IDs, Headings
--base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
--base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

-- manual fixes
-- see: https://github.com/echasnovski/mini.base16/blob/main/lua/mini/base16.lua

-- native vim
--vim.api.nvim_set_hl(0, 'Function', { fg = p.base05, bg = nil })
vim.api.nvim_set_hl(0, 'LineNr', { bg = nil, fg = p.base03 })
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = nil, fg = p.base09 })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { bg = nil, fg = p.base09 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = p.base01, fg = nil })

-- gitsigns
vim.api.nvim_set_hl(0, 'SignColumn', { bg = nil, fg = nil })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = nil, fg = p.base0A })
vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = nil, fg = p.base05 })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = nil, fg = p.base09 })

-- mini.tabline
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { fg = p.base00, bg = p.base05, sp = nil })
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = p.base05, bg = pext.tabline01, sp = nil })
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { fg = p.base05, bg = pext.tabline01, sp = nil })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { fg = p.base00, bg = p.base0E, sp = nil })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { fg = p.base04, bg = p.base00, sp = nil })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { fg = p.base04, bg = p.base00, sp = nil })

-- hidden #585858
--

-- syntax: Markdown

vim.api.nvim_set_hl(0, 'markdownListMarker', { bg = nil, fg = p.base0E })

-- set it

--vim.cmd([[colorscheme woytheme1]])
