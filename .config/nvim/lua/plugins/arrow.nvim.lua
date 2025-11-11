-- quick per project bookmarks
-- to try fix the problem of me having too many buffers there making buffer
-- navigation a hassle

return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- or if using `mini.icons`
    -- { "echasnovski/mini.icons" },
  },
  opts = {
    show_icons = true,
    leader_key = ';', -- Recommended to be a single key
    buffer_leader_key = "'", -- Per Buffer Mappings
  }
}
--return {
    --'otavioschwanck/arrow.nvim',
    --config = function()
        --require('aerial').setup {
            ---- global floating
            --attach_mode = 'global',
            --layout = {
                --default_direction = 'float',
                --placement = 'edge',
                --min_width = 100,
                ----resize_to_content = true, -- doesn't work
            --},
            --float = {
                --relative = 'editor',
            --},

            ---- remap p to o, navigate to without closing window
            --keymaps = {
                --['o'] = 'actions.scroll',
                --['<Esc>'] = 'actions.close',
            --},
        --}
        --vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>')
    --end,
--}
