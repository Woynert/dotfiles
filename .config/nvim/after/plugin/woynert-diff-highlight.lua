function WoyDiffHighlight(factor)
    if factor == nil then
        factor = 0.2
    end

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

    -- TODO: Use `:echo synIDattr(synIDtrans(hlID("normal")), "bg#")` instead
    -- TODO: Use `:echo vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("normal")), "bg#")` instead

    --local normal = vim.api.nvim_get_hl(0, { name = 'normal' })
    --local diffAdd = vim.api.nvim_get_hl(0, { name = 'DiffAdd' })
    --local diffChange = vim.api.nvim_get_hl(0, { name = 'DiffChange' })
    --local diffDelete = vim.api.nvim_get_hl(0, { name = 'DiffDelete' })
    --local diffText = vim.api.nvim_get_hl(0, { name = 'DiffText' })
    local normal = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("normal")), "bg#")
    local diffAdd = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffAdd")), "bg#")
    local diffChange = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffChange")), "bg#")
    local diffDelete = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffDelete")), "bg#")
    local diffText = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiffText")), "bg#")
    --local factor = 0.5

    if GlobalDiffColorsBackup == nil then
        GlobalDiffColorsBackup = {
            add = diffAdd,
            change = diffChange,
            delete = diffDelete,
            text = diffText,
        }
    end

    local colorbk = GlobalDiffColorsBackup

    --print(colorbk.add)
    --print(normal)
    --print(ColorBlender.blend_hex(colorbk.add, normal, factor))
    --for i = 0, 10, 1 do
        --print(ColorBlender.blend_hex(colorbk.add, normal, (i/10)))
    --end
    --vim.api.nvim_set_hl(0, 'DiffAdd', { bg = "", })

    vim.api.nvim_set_hl(0, 'DiffAdd', {
        bg = ColorBlender.blend_hex(colorbk.add, normal, factor),
    })
    vim.api.nvim_set_hl(0, 'DiffChange', {
        bg = ColorBlender.blend_hex(colorbk.change, normal, factor),
    })
    vim.api.nvim_set_hl(0, 'DiffDelete', {
        bg = ColorBlender.blend_hex(colorbk.delete, normal, factor),
        fg = ColorBlender.blend_hex(colorbk.delete, normal, 1),
    })
    vim.api.nvim_set_hl(0, 'DiffText', {
        bg = ColorBlender.blend_hex(colorbk.text, normal, factor + 0.1),
    })
end
