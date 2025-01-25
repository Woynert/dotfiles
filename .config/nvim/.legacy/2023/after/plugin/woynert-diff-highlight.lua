function WoyDiffHighlight()
    -- tab motions for code review

    vim.api.nvim_exec(
        [[
    nnoremap <Left> :tabp<CR>
    nnoremap <Right> :tabn<CR>
    nnoremap <Up> :tabs<CR>
    nnoremap <C-Down> :windo bd<CR>
    ]],
        false
    )

    -- diff highlight groups
    -- preserve only background

    local normal = vim.api.nvim_get_hl(0, { name = 'normal' })
    local diffAdd = vim.api.nvim_get_hl(0, { name = 'DiffAdd' })
    local diffChange = vim.api.nvim_get_hl(0, { name = 'DiffChange' })
    local diffDelete = vim.api.nvim_get_hl(0, { name = 'DiffDelete' })
    local diffText = vim.api.nvim_get_hl(0, { name = 'DiffText' })
    local factor = 0.3

    if GlobalDiffColorsBackup == nil then
        GlobalDiffColorsBackup = {
            add = diffAdd.bg,
            change = diffChange.bg,
            delete = diffDelete.bg,
            text = diffText.bg,
        }
    end

    local colorbk = GlobalDiffColorsBackup

    vim.api.nvim_set_hl(0, 'DiffAdd', {
        bg = ColorBlender.blend_dec(colorbk.add, normal.bg, factor),
    })
    vim.api.nvim_set_hl(0, 'DiffChange', {
        bg = ColorBlender.blend_dec(colorbk.change, normal.bg, factor),
    })
    vim.api.nvim_set_hl(0, 'DiffDelete', {
        bg = ColorBlender.blend_dec(colorbk.delete, normal.bg, factor),
        fg = ColorBlender.blend_dec(colorbk.delete, normal.bg, 1),
    })
    vim.api.nvim_set_hl(0, 'DiffText', {
        bg = ColorBlender.blend_dec(colorbk.text, normal.bg, factor + 0.1),
    })
end
