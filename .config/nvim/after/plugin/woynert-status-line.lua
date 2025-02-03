-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/

woy_status_line = {}

function woy_status_line.diagnostic()
    local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local num_hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    local msg = ' '
    if num_errors > 0 then
        msg = msg .. '%#DiagnosticError#' .. ' ⚠ (' .. num_errors .. ')'
    end
    if num_warnings > 0 then
        msg = msg .. '%#DiagnosticWarn#' .. ' ⚠ (' .. num_warnings .. ')'
    end
    if num_hints > 0 then
        msg = msg .. '%#DiagnosticHint#' .. ' H(' .. num_hints .. ')'
    end
    -- No reported issues
    if (num_errors + num_warnings + num_hints) == 0 then
        msg = msg .. '%#DiagnosticInfo#' .. ' ✔(0)'
    end
    msg = msg .. ' '
    return msg
end

function woy_status_line.lsp_active()
    local buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients { bufnr = buf }
    if not vim.tbl_isempty(clients) then
        return ' Lsp'
    end
    return ''
end

function woy_status_line.root()
    local parts = {
        -- window number
        '%#WarningMsg#',
        ' %{winnr()} ',
        '%* ',

        -- file path, modified, read only
        [[%<%f %m%r%=]],

        -- line, column, real column
        '%l,%c%V%=',

        -- lsp active?
        [[%{luaeval("woy_status_line.lsp_active()")}]],

        -- lsp warning, errors
        woy_status_line.diagnostic(),

        -- vimL expressions can be placed into `%{ ... }` blocks
        -- The expression uses a conditional (ternary) operator: <condition> ? <truthy> : <falsy>
        -- If the current file format is not 'unix', display it surrounded by [], otherwise show nothing
        "%{&ff!='unix'?'['.&ff.'] ':''}",

        -- Resets the highlight group
        '%*',

        '%#WarningMsg#',
        -- Same as before with the file format, except for the file encoding and checking for `utf-8`
        "%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.'] ':''}",
        '%*',
    }
    return table.concat(parts, '')
end

vim.opt.statusline = '%!v:lua.woy_status_line.root()'

-- Toggle status line
vim.keymap.set('n', '<leader>n', function()
    if vim.o.laststatus == 0 then
        vim.opt.laststatus = 2
    else
        vim.opt.laststatus = 0
    end
end)
