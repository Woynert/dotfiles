-- color corrections

function WoyMinHighlight ()

-- sign columns workaround for lifepillar/vim-gruvbox8. Broken by default

local diffAdd = vim.api.nvim_get_hl_by_name("DiffAdd", true)
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = diffAdd.background, fg = diffAdd.foreground })
--vim.api.nvim_set_hl(0, 'DiffAdd', { bg = nil, fg = diffAdd.background })

local diffChange = vim.api.nvim_get_hl_by_name("DiffChange", true)
vim.api.nvim_set_hl(0, 'DiffChange', { bg = diffChange.background, fg = diffChange.foreground })
--vim.api.nvim_set_hl(0, 'DiffChange', { bg = nil, fg = diffChange.background })

local diffDelete = vim.api.nvim_get_hl_by_name("DiffDelete", true)
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = diffDelete.background, fg = diffDelete.foreground })
--vim.api.nvim_set_hl(0, 'DiffDelete', { bg = nil, fg = diffDelete.background })

local signColumn = vim.api.nvim_get_hl_by_name("SignColumn", true)
vim.api.nvim_set_hl(0, 'SignColumn', { bg = nil, fg = signColumn.background })

-- toggle minimal highlight

-- toggle

local enable = 1

if enable < 1 then
    return
end

-- reset common groups

local groups = {
--'Boolean',
--'Character',
'Conditional',
--'Constant',
'Define',
'Debug',
'Delimiter',
'Error',
'Exception',
--'Float',
'Function',
'Identifier',
'Ignore',
--'Include',
--'Keyword',
'Label',
--'Macro',
--'Number',
'Operator',
--'PreCondit',
--'PreProc',
'Repeat',
'SpecialChar',
'SpecialComment',
--'Statement',
'StorageClass',
'Special',
--'String',
--'Structure',
--'Type',
--'Typedef',
'Underlined',
'markdownCodeBlock', -- there is a bug that indented text below a list item is considered as code block
'@lsp.type.comment.cpp',
}

for i = 1, #groups do
    vim.api.nvim_set_hl(0, groups[i], { fg = nil })
end

-- custom

--vim.api.nvim_set_hl(0, 'Comment', { fg = vim.g.terminal_color_12 })
--vim.api.nvim_set_hl(0, 'PreProc', { fg = vim.g.terminal_color_12 })
--vim.api.nvim_set_hl(0, 'PreCondit', { fg = vim.g.terminal_color_12 })

local color_value = vim.g.terminal_color_13
vim.api.nvim_set_hl(0, 'String', { fg = color_value })
vim.api.nvim_set_hl(0, 'Boolean', { fg = color_value })
vim.api.nvim_set_hl(0, 'Character', { fg = color_value })
vim.api.nvim_set_hl(0, 'Number', { fg = color_value })
vim.api.nvim_set_hl(0, 'Float', { fg = color_value })
vim.api.nvim_set_hl(0, 'Constant', { fg = color_value })

end

WoyMinHighlight()

--local diffAdd = vim.api.nvim_get_hl_by_name("DiffAdd", true)
----vim.api.nvim_set_hl(0, 'DiffAdd', { bg = diffAdd.background, fg = diffAdd.foreground })
--vim.api.nvim_set_hl(0, 'DiffAdd', { bg = nil, fg = diffAdd.background })

--local diffChange = vim.api.nvim_get_hl_by_name("DiffChange", true)
----vim.api.nvim_set_hl(0, 'DiffChange', { bg = diffChange.background, fg = diffChange.foreground })
--vim.api.nvim_set_hl(0, 'DiffChange', { bg = nil, fg = diffChange.background })

--local diffDelete = vim.api.nvim_get_hl_by_name("DiffDelete", true)
----vim.api.nvim_set_hl(0, 'DiffDelete', { bg = diffDelete.background, fg = diffDelete.foreground })
--vim.api.nvim_set_hl(0, 'DiffDelete', { bg = nil, fg = diffDelete.background })

--local signColumn = vim.api.nvim_get_hl_by_name("SignColumn", true)
--vim.api.nvim_set_hl(0, 'SignColumn', { bg = nil, fg = signColumn.background })
