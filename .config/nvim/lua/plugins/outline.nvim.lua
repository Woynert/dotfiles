return {
    "woynert/outline.nvim",
    branch = "feat/add-floating-window-ui",
    --dir = '/home/woynert/.config/nvim/lua/localplugins/outline.nvim/',
    --dir = '/home/woynert/.config/nvim/lua/localplugins/outline.nvim/',
    config = function()

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
            outline_items = {
                -- Show extra details with the symbols (lsp dependent) as virtual next
                show_symbol_details = false,
            },
            outline_window = {
                float = {
                  -- Percentage or integer of columns
                  --width = 80,
                  ---- Percentage or integer of lines
                  --height = 90,
                  ---- Whether width is relative to the total width of nvim
                  --relative_width = true,
                  ---- Whether height is relative to the total height of nvim
                  --relative_height = true,
                  
                  -- Pass a function here to dynamically calculate center coordinates
                  win_config = function()
                    -- 1. Grab Neovim's absolute UI boundaries
                    local total_cols = vim.o.columns
                    local total_lines = vim.o.lines

                    -- 2. Convert your relative width/height percentages into raw grid numbers
                    -- (Since width = 30% and height = 80%)
                    --local win_width = math.floor(total_cols * 0.80)
                    local win_width = 100
                    local win_height = math.floor(total_lines * 0.80)

                    -- 3. Calculate center math: (Total Space - Window Space) / 2
                    local center_row = math.floor((total_lines - win_height) / 2)
                    local center_col = math.floor((total_cols - win_width) / 2)

                    return {
                      relative = 'editor',
                      row = center_row,   -- Offsets from top edge
                      col = center_col,   -- Offsets from left edge
                      width = win_width,  -- Enforces calculated absolute width
                      height = win_height,-- Enforces calculated absolute height
                      border = 'rounded',
                      zindex = 50,
                      focusable = true,
                      --style = 'minimal',
                      --title = 'Outline',
                      --title_pos = 'center',
                    }
                  end,
                  
                  -- Additional window options (set via nvim_win_set_option)
                  win_options = {},
                },

            }

        }


        -- Mappings
        vim.keymap.set("n", "<leader>a", "<cmd>OutlineToggleFloat<CR>", { desc = "Toggle Outline" })

    end,
}
