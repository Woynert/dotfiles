return {
    'nvim-mini/mini.align',
    version = false,
    config = function ()
        require('mini.align').setup({
            mappings = {
                start = '',
                start_with_preview = 'ga',
            },
        })
    end
}
