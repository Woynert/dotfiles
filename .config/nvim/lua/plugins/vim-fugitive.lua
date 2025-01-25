return {

    'tpope/vim-fugitive',

    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

        -- quick add file

        vim.api.nvim_create_user_command('Gitadd', function()
            vim.api.nvim_command ':Git add %'
        end, {})

        -- open in buffer

        vim.api.nvim_create_user_command('G', function()
            vim.api.nvim_command ':Gedit :'
        end, {})

        ---- open in float window
        --https://www.reddit.com/r/neovim/comments/1ag5mk3/fugitive_change_window_to_popup/
    end,
}
