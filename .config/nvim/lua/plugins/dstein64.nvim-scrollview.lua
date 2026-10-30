return {
    'dstein64/nvim-scrollview',
    config = function ()

        local scrollview = require('scrollview')
        scrollview.setup ({
            signs_on_startup = {
                --'changelist', -- change list items (previous, current, and next)
                'conflicts', -- git merge conflicts
                'cursor', -- cursor position
                'diagnostics', -- errors, warnings, info, and hints
                --'folds', -- closed folds
                --'indent', -- unexpected indentation characters (e.g., tabs when expandtab is set)
                -- (see :help scrollview-signs-keywords for customization info)
                --'keywords', -- FIX, FIXME, HACK, TODO, WARN, WARNING, and XXX 
                'latestchange', -- latest change
                --'loclist', -- items on the location list
                --'marks', --
                --'quickfix', -- items on the quickfix list
                'search', --
                'spell', -- spell check items when the spell option is enabled
                --'textwidth', -- line lengths exceeding the value of the textwidth option, when non-zero
                --'trail', -- trailing whitespace
            },
            cursor_symbol = '💜',
        })

        require('scrollview.contrib.gitsigns').setup({
            add_symbol = '|',
            change_symbol = '~',
            delete_symbol = 'x',
            add_highlight = 'WoyGitAdd',
            --change_highlight = 'WoyGitChange',
            delete_highlight = 'WoyGitDelete',
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
          callback = function()
            -- Changing themes clears everything so we use the callback
            vim.api.nvim_set_hl(0, 'WoyGitAdd',    { fg = "#00ff00" })
            vim.api.nvim_set_hl(0, 'WoyGitChange', { fg = "#0000ff" })
            --vim.api.nvim_set_hl(0, 'WoyGitDelete', { fg = "#ff0000" })
            vim.api.nvim_set_hl(0, 'WoyGitDelete', { fg = "#F92672" })
          end,
        })

        vim.keymap.set('n', '<leader>m', function()
            --scrollview.toggle()
            vim.cmd("ScrollViewToggle")
        end)
    end
}

-- '💜' 💔💜💖😻💘💝💗
