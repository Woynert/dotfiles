
-- Setups syntax highlighting.

return {
    'nvim-treesitter/nvim-treesitter',
    --branch = 'main', commit = '4916d6592ede8c07973490d9322f187e07dfefac', -- Enable this if using latest Neovim. (Must rewrite config).
    branch = 'main',
    build = ':TSUpdate',
    config = function ()
        require('nvim-treesitter').install {
            'c',
            'cpp',
            'bash',
            'gitignore',
            'lua',
            'vim',
            'vimdoc',
            'markdown',
            'markdown_inline',
            --'javascript',
            --'typescript',
            'json',
            'yaml',
            'python',
            --'gdscript',
            --'latex'
        }
    end,
}

--return {
    --'nvim-treesitter/nvim-treesitter',

    --tag = 'v0.10.0', -- Enable this if using Neovim 0.12.x.
    ----tag = 'v0.9.3', -- Enable this if using Neovim 0.9.2+.
    ----branch = "main", -- Enable this if using latest Neovim. (Must rewrite config).

    --build = ':TSUpdate',

    --config = function()
        ---- Setups correct syntax highlighting

        --require('nvim-treesitter.configs').setup {
            ---- A list of parser names
            --ensure_installed = {
                --'bash',
                --'gitignore',
                --'c',
                --'cpp',
                --'lua',
                --'vim',
                --'vimdoc',
                --'markdown',
                --'markdown_inline',
                --'javascript',
                --'typescript',
                --'json',
                --'yaml',
                --'python',
                --'gdscript',
                --'latex'
            --},

            ---- Install parsers synchronously (only applied to `ensure_installed`)
            --sync_install = false,

            ---- Automatically install missing parsers when entering buffer
            ---- Recommendation: set to false if you don't have `tree-sitter` CLI inst alled locally
            --auto_install = false,

            --highlight = {
                --enable = true,
                --additional_vim_regex_highlighting = false,
            --},
        --}
    --end,
--}

---- use 'nvim-treesitter/playground'
