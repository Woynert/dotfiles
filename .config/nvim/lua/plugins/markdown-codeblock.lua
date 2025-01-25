-- markdown codeblocks
return {
    'yaocccc/nvim-hl-mdcodeblock.lua',
    after = 'nvim-treesitter',
    config = function()
        require('hl-mdcodeblock').setup {
            -- option
            minumum_len = 30,
        }
    end,
}
