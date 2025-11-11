return {
    --'caenrique/swap-buffers.nvim',
    dir = '/home/woynert/.config/nvim/lua/localplugins/swap-buffers',
    config = function ()
        local swapbuffers = require('swap-buffers')

        vim.keymap.set('n', '<leader>wh', function() swapbuffers.swap_buffers('h') end)
        vim.keymap.set('n', '<leader>wj', function() swapbuffers.swap_buffers('j') end)
        vim.keymap.set('n', '<leader>wk', function() swapbuffers.swap_buffers('k') end)
        vim.keymap.set('n', '<leader>wl', function() swapbuffers.swap_buffers('l') end)

        vim.api.nvim_create_user_command('Swap', function (args)
            local window_number = tonumber(args.args)
            local window_id = vim.fn.win_getid(window_number)
            swapbuffers.swap_buffers_windows(window_id)
        end, { desc = "Swap buffers between windows", nargs = 1 })

        -- Moving between windows (from Ben Frain's talk at NeovimConf 2022)
        for i = 1, 9 do
          local keymap = "<leader>w" .. i
          local cmd = i .. ":lua require('swap-buffers').swap_buffers_windows(vim.fn.win_getid(" .. i .. ")) <CR>"
          vim.keymap.set("n", keymap, cmd, { desc = "Move to window " .. i })
        end
    end
}
