-- markdown headlines
return {
    'woynert/headlines.nvim',
    branch = 'refactor/wip',
    after = 'nvim-treesitter',
    config = function()
        require('headlines').setup()
    end,
}
