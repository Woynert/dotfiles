-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>")

require("nvim-tree").setup({
    view = {
        mappings = {
            list = {
                -- Disable open in new tab
                { key = "<C-t>", action = "" }
            }
        }
    }
})
