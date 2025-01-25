return {
    'psliwka/vim-smoothie',
    config = function()
        --vim.g.smoothie_update_interval = 10
        --vim.g.smoothie_speed_constant_factor = 60
        vim.g.smoothie_speed_linear_factor = 60
        vim.g.smoothie_speed_exponentiation_factor = 0.5
    end,
}
