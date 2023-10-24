vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- quick add file

vim.api.nvim_create_user_command('Gitadd', function()
    vim.api.nvim_command(":Git add %")
end, {})
