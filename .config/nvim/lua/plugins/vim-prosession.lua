return {
    'dhruvasagar/vim-prosession',
    dependencies = {
        'tpope/vim-obsession',
    },
    config = function()
        require('telescope').load_extension 'prosession'
        vim.keymap.set('n', '<Leader>z', '<cmd>Telescope prosession<CR>')
    end,
}
