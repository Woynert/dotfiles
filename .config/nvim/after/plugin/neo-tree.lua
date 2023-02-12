-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

---- set termguicolors to enable highlight groups
---- vim.opt.termguicolors = true

--vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
--vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>")

--require("nvim-tree").setup({
    --view = {
        --mappings = {
            --list = {
                ---- Disable open in new tab
                --{ key = "<C-t>", action = "" }
            --}
        --}
    --}
--})

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

