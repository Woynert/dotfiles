vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_hide = false,
        },
        window = {
            mappings = {
                ["o"] = "open",
                ["Z"] = "expand_all_nodes",
            }
        }
    }
})

vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>n", ":Neotree<CR>")
vim.keymap.set("n", "<leader>pv", ":Neotree reveal<CR>")

