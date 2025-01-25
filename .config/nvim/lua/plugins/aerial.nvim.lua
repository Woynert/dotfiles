-- outline
return {
    'stevearc/aerial.nvim',
    config = function()
        require('aerial').setup {
            -- global floating
            attach_mode = 'global',
            layout = {
                default_direction = 'float',
                placement = 'edge',
            },
            float = {
                relative = 'editor',
            },

            -- remap p to o, navigate to without closing window
            keymaps = {
                ['o'] = 'actions.scroll',
                ['<Esc>'] = 'actions.close',
            },
        }
        vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>')
    end,
}
