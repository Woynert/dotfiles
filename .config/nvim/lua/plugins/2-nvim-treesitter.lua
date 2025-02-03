-- Setups correct syntax highlighting

return {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.3', -- neovim 0.9.2 or later
    build = ':TSUpdate',

    config = function()
        -- Setups correct syntax highlighting

        require('nvim-treesitter.configs').setup {
            -- A list of parser names
            ensure_installed = {
                'bash',
                'gitignore',
                'c',
                'cpp',
                'lua',
                'vim',
                'vimdoc',
                'markdown',
                'markdown_inline',
                'javascript',
                'typescript',
                'json',
                'yaml',
                'python',
                'gdscript'
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI inst alled locally
            auto_install = false,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}

-- use 'nvim-treesitter/playground'
