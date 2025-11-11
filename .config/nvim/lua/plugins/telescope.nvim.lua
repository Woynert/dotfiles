local telescope_command_palette_config = function ()
    return {
        {
            'Formatters',
            { 'prettier', 'exe "%!prettier --stdin-filepath %" | :DetectIndent' },
            { 'clang-format', 'exe "%!clang-format" | :DetectIndent' },
        },
        {
            'Util',
            { 'Close all buffers except current', ':%bd|e#|bd#' },
            { 'Enable autosave', ':autocmd CursorHold,CursorHoldI * update' },
            { 'Get full path FIXME', ":echo expand('%:p')" }, -- TODO: figure out how to print
        },
        {
            'File',
            { 'entire selection (C-a)', ':call feedkeys("GVgg")' },
            { 'save current file (C-s)', ':w' },
            { 'save all files (C-A-s)', ':wa' },
            { 'quit (C-q)', ':qa' },
            {
                'file browser (C-i)',
                ":lua require'telescope'.extensions.file_browser.file_browser()",
                1,
            },
            { 'search word (A-w)', ":lua require('telescope.builtin').live_grep()", 1 },
            { 'git files (A-f)', ":lua require('telescope.builtin').git_files()", 1 },
            { 'files (C-f)', ":lua require('telescope.builtin').find_files()", 1 },
        },
        {
            'Help',
            { 'tips', ':help tips' },
            { 'cheatsheet', ':help index' },
            { 'tutorial', ':help tutor' },
            { 'summary', ':help summary' },
            { 'quick reference', ':help quickref' },
            { 'search help(F1)', ":lua require('telescope.builtin').help_tags()", 1 },
        },
        {
            'Vim',
            { 'reload vimrc', ':source $MYVIMRC' },
            { 'check health', ':checkhealth' },
            { 'jumps (Alt-j)', ":lua require('telescope.builtin').jumplist()" },
            { 'commands', ":lua require('telescope.builtin').commands()" },
            {
                'command history',
                ":lua require('telescope.builtin').command_history()",
            },
            { 'registers (A-e)', ":lua require('telescope.builtin').registers()" },
            { 'colorshceme', ":lua require('telescope.builtin').colorscheme()", 1 },
            { 'vim options', ":lua require('telescope.builtin').vim_options()" },
            { 'keymaps', ":lua require('telescope.builtin').keymaps()" },
            { 'buffers', ':Telescope buffers' },
            {
                'search history (C-h)',
                ":lua require('telescope.builtin').search_history()",
            },
            { 'paste mode', ':set paste!' },
            { 'cursor line', ':set cursorline!' },
            { 'cursor column', ':set cursorcolumn!' },
            { 'spell checker', ':set spell!' },
            { 'relative number', ':set relativenumber!' },
            { 'search highlighting (F12)', ':set hlsearch!' },
        },
    }
end


return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {

        'nvim-lua/plenary.nvim',

        'BurntSushi/ripgrep',

        'LinArcX/telescope-command-palette.nvim',

        { 
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    config = function ()

        local telescope = require("telescope")

        telescope.setup {
            extensions = {
                command_palette = telescope_command_palette_config()
            },
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "-P",
                },
            },
        }

        -- builtin

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        --vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string { search = vim.fn.input 'Grep > ' }
        end)
        vim.keymap.set('n', '<leader>px', builtin.quickfixhistory, {})
        vim.keymap.set('n', '<leader>pb', function()
            builtin.buffers({
                sort_mru = true,
                -- other options show_all_buffers = false, ignore_current_buffer = true
            })
        end, { desc = "Find recent buffers" })

        -- live_grep_args

        telescope.load_extension("live_grep_args")

        vim.keymap.set("n", "<leader>pg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

        -- command_palette

        telescope.load_extension 'command_palette'

        vim.api.nvim_create_user_command('Palette', function()
            telescope.extensions.command_palette.command_palette()
        end, {})

        vim.keymap.set('n', '<leader>pc', ':Telescope command_palette<CR>')
    end
}
