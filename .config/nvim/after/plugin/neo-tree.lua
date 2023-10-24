vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
    popup_border_style = "rounded",

    default_component_configs = {
        container = {
            enable_character_fade = false,
        },
        indent = {
            indent_size = 2,
            padding = 0,
            with_markers = true,
        },
        name = {
            trailing_slash = false,
        },
    },

    window = {
        position = "right",
        width = 32,
    },

    filesystem = {
        use_libuv_file_watcher = true, -- watch file changes
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_hide = false,
        },
        window = {
            mappings = {
                ["o"] = "open",
                ["Z"] = "expand_all_nodes",
                ["P"] = { "toggle_preview", config = { use_float = false } },

                -- hjkl movement

                ["h"] = function(state)
                  local node = state.tree:get_node()
                    if node.type == 'directory' and node:is_expanded() then
                      require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                    else
                      require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
                    end
                  end,
                ["l"] = function(state)
                  local node = state.tree:get_node()
                    if node.type == 'directory' then
                      if not node:is_expanded() then
                        require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                      elseif node:has_children() then
                        require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                      end
                    end
                  end,
            },

            -- adjust window size

            popup = {
              size = function(_)
                return {
                  width = math.min(vim.o.columns - 6, 80),
                  height = vim.o.lines - 6
                }
              end
            },
        },

        -- no icons

        components = {
            icon = function(config, node, state)
                if node.type == "file" or node.type == "directory" then
                    return {}
                end
                return require("neo-tree.sources.common.components").icon(config,
                node, state)
            end
        }

    },

})

vim.keymap.set("n", "<leader>t", ":NeoTreeFocusToggle<CR>") -- sidebar
vim.keymap.set("n", "<leader>f", ":NeoTreeFloatToggle<CR>") -- float
vim.keymap.set("n", "<leader>n", ":Neotree<CR>") -- focus
vim.keymap.set("n", "<leader>pv", ":Neotree reveal<CR>")
