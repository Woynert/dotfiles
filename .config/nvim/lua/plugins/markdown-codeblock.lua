-- markdown codeblocks
return {
    "yaocccc/nvim-hl-mdcodeblock.lua",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'markdown',
    opts = {
        minumum_len = 30,
    }
}
