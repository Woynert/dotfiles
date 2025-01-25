return {
    'iamcco/markdown-preview.nvim',
    run = function()
        vim.fn['mkdp#util#install']()
    end,
    config = function()
        -- Do not autoclose after switching buffers
        vim.g.mkdp_auto_close = 0
        -- Reuse current open tab when switching buffers
        vim.g.mkdp_combine_preview = 1
        -- Use chromium
        vim.g.mkdp_browser = 'chromium'
    end,
}
