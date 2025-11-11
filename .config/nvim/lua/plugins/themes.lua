return {
    'NLKNguyen/papercolor-theme',
    { 'sainnhe/edge',
        init = function()
            vim.g.edge_colors_override = { bg0 = { "#292929", "234" } }
        end
    },
    'nyoom-engineering/oxocarbon.nvim',

    -- 02/02/2025
    --'srcery-colors/srcery-vim', 
    --{ 'olimorris/onedarkpro.nvim',
        --priority = 1000, enabled = true },
    --'jacoborus/tender.vim',
    --{ 'navarasu/onedark.nvim',
    --config = function() require('onedark').setup {
        ---- style = 'darker' -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        ---- ... other options
    --} end },
}
