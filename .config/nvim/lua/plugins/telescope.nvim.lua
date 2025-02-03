return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
    },
    config = function ()
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string { search = vim.fn.input 'Grep > ' }
        end)
    end
}
