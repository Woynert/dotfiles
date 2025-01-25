return {
    'timakro/vim-yadi',

    -- TODO: BUG
    -- When opening an empty python file with some commments on it, this plugin will set the tab
    -- width value to be 91 columns, fix -> configure a limit tab value

    -- auto detect at file events
    config = function()
        vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost', 'BufFilePost' }, {
            pattern = '*',
            command = 'DetectIndent',
        })
    end,
}
