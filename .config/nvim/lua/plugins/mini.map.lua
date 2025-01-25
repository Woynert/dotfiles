--return { 'woynert/mini.map',
return {
    'echasnovski/mini.map',
    config = function()
        local map = require 'mini.map'
        map.setup {
            integrations = {
                map.gen_integration.builtin_search(),
                map.gen_integration.gitsigns(),
                map.gen_integration.diagnostic(), -- code errors, warnings
            },
            symbols = {
                encode = map.gen_encode_symbols.dot '4x2',
            },
        }
        vim.keymap.set('n', '<leader>m', function()
            MiniMap.toggle()
        end)
    end,
    dependencies = { 'lewis6991/gitsigns.nvim' },
}
