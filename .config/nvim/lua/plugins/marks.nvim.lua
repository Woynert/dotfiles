return {
    'ValJed/marks.nvim',
    branch = 'feat-telescope-support-for-listing-marks',
    config = function()
        local marks_status_ok, marks = pcall(require, 'marks')
        if not marks_status_ok then
            return
        end

        marks.setup {}

        -- telescope extension

        local telescope_status_ok, telescope = pcall(require, 'telescope')
        if not telescope_status_ok then
            return
        end

        telescope.load_extension 'marks_nvim'

        -- shortcuts

        vim.keymap.set('n', '<leader>b', telescope.extensions.marks_nvim.marks_list_all)
    end,
}
