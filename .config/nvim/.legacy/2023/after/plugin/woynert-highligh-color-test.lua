function WoyColorTest()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Cursor position is 0-indexed

    --row = 1193
    --col = 3

    local hl_group = vim.fn.synIDattr(vim.fn.synID(row, col, 1), 'name')
    --local hl_group_id = vim.fn.synID("MyGroup")
    local hl_group_id = vim.api.nvim_get_hl_id_by_name(hl_group)

    print(hl_group)
    print(type(hl_group))
    print(hl_group_id)
    print(vim.fn.synID(row, col, 1))
    print(vim.fn.synID(row, col, 0))
end

function WoyColorTest2()
    local s = vim.fn.synID(vim.fn.line '.', vim.fn.col '.', 1)
    print(vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name'))
end
