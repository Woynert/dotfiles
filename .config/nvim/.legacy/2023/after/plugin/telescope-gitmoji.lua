local telescope = require 'telescope'

telescope.setup {
    extensions = {
        gitmoji = {
            action = function(entry)
                -- TODO: Add all emojis
                -- entry = {
                --   display = "🐛 Fix a bug.",
                --   index = 4,
                --   ordinal = "Fix a bug.",
                --   value = {
                --     description = "Fix a bug.",
                --     text = ":bug:",
                --     value = "🐛"
                --   }
                -- }
                local emoji = entry.value.value
                -- Get row and column cursor,
                -- use unpack because it's a tuple.
                local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                -- Params 2-5 are for start and end of row and columns.
                -- See earlier docs for param clarification or `:help nvim_buf_set_text.
                vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { emoji })

                ---- Insert text instead of emoji in message
                --local emoji_text = entry.value.text
            end,
        },
    },
}

telescope.load_extension 'gitmoji'

-- user function
vim.api.nvim_create_user_command('Gitmoji', function()
    telescope.extensions.gitmoji.gitmoji()
end, {})
