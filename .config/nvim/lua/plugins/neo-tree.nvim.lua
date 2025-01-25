return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not required, but recommended
        'MunifTanjim/nui.nvim',
    },
    config = function()
        vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

        require('neo-tree').setup {
            popup_border_style = 'rounded',

            default_component_configs = {
                container = {
                    enable_character_fade = false,
                },
                indent = {
                    indent_size = 2,
                    padding = 0,
                    with_markers = true,
                    with_expanders = true,
                    expander_collapsed = '>',
                    expander_expanded = '-',
                },
                name = {
                    trailing_slash = false,
                },

                -- info columns
                file_size = { enabled = true, required_width = 100 },
                type = { enabled = false },
                last_modified = {
                    enabled = true,
                    required_width = 50, -- min width of window required to show this column
                },
                created = { enabled = false },
                symlink_target = { enabled = false },
            },

            window = {
                position = 'float', -- default position
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
                        ['o'] = { 'open', nowait = true },
                        ['Z'] = 'expand_all_nodes',
                        ['P'] = { 'toggle_preview', config = { use_float = false } },

                        -- hjkl movement
                        ['h'] = function(state)
                            local node = state.tree:get_node()
                            if node.type == 'directory' and node:is_expanded() then
                                require('neo-tree.sources.filesystem').toggle_directory(state, node)
                            else
                                require('neo-tree.ui.renderer').focus_node(
                                    state,
                                    node:get_parent_id()
                                )
                            end
                        end,
                        ['l'] = function(state)
                            local node = state.tree:get_node()
                            if node.type == 'directory' then
                                if not node:is_expanded() then
                                    require('neo-tree.sources.filesystem').toggle_directory(
                                        state,
                                        node
                                    )
                                elseif node:has_children() then
                                    require('neo-tree.ui.renderer').focus_node(
                                        state,
                                        node:get_child_ids()[1]
                                    )
                                end
                            end
                        end,

                        -- replace all default bindings starting with o to O
                        ['oc'] = 'noop',
                        ['od'] = 'noop',
                        ['og'] = 'noop',
                        ['om'] = 'noop',
                        ['on'] = 'noop',
                        ['os'] = 'noop',
                        ['ot'] = 'noop',
                        ['O'] = {
                            'show_help',
                            nowait = false,
                            config = { title = 'Order by', prefix_key = 'O' },
                        },
                        ['Oc'] = { 'order_by_created', nowait = false },
                        ['Od'] = { 'order_by_diagnostics', nowait = false },
                        ['Og'] = { 'order_by_git_status', nowait = false },
                        ['Om'] = { 'order_by_modified', nowait = false },
                        ['On'] = { 'order_by_name', nowait = false },
                        ['Os'] = { 'order_by_size', nowait = false },
                        ['Ot'] = { 'order_by_type', nowait = false },
                    },

                    -- adjust window size

                    popup = {
                        size = function(_)
                            return {
                                width = math.min(vim.o.columns - 8, 100),
                                height = vim.o.lines - 6,
                            }
                        end,
                    },
                },

                -- no icons

                components = {
                    icon = function(config, node, state)
                        if node.type == 'file' or node.type == 'directory' then
                            return {}
                        end
                        return require('neo-tree.sources.common.components').icon(
                            config,
                            node,
                            state
                        )
                    end,
                },
            },
            git_status = {
                window = {
                    mappings = {
                        ['o'] = 'open',
                        ['Z'] = 'expand_all_nodes',
                        ['P'] = { 'toggle_preview', config = { use_float = false } },

                        -- hjkl movement
                        ['h'] = function(state)
                            local node = state.tree:get_node()
                            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                        end,
                        ['l'] = function(state)
                            local node = state.tree:get_node()
                            if node.type == 'directory' then
                                if node:is_expanded() then
                                    require('neo-tree.ui.renderer').focus_node(
                                        state,
                                        node:get_child_ids()[1]
                                    )
                                end
                            end
                        end,

                        -- replace all default bindings starting with o to O
                        ['oc'] = 'noop',
                        ['od'] = 'noop',
                        ['og'] = 'noop',
                        ['om'] = 'noop',
                        ['on'] = 'noop',
                        ['os'] = 'noop',
                        ['ot'] = 'noop',
                        ['O'] = {
                            'show_help',
                            nowait = false,
                            config = { title = 'Order by', prefix_key = 'O' },
                        },
                        ['Oc'] = { 'order_by_created', nowait = false },
                        ['Od'] = { 'order_by_diagnostics', nowait = false },
                        ['Og'] = { 'order_by_git_status', nowait = false },
                        ['Om'] = { 'order_by_modified', nowait = false },
                        ['On'] = { 'order_by_name', nowait = false },
                        ['Os'] = { 'order_by_size', nowait = false },
                        ['Ot'] = { 'order_by_type', nowait = false },
                    },
                },
            },
        }

        function toggle_nvimtree()
            if vim.fn.bufname():match 'neo-tree' then
                vim.cmd.wincmd 'p'
            end
        end

        -- Which-Key
        --e  = { "<cmd>:lua toggle_nvimtree()<CR>", "Explorer Focus Toggle without closing" },
        --r  = { "<cmd>:lua require('nvim-tree.api').tree.toggle(false, true)<CR>", "Explorer Peek" },

        vim.keymap.set('n', '<leader>tr', ':Neotree toggle left<CR>')
        vim.keymap.set('n', '<leader>tt', ':Neotree toggle right<CR>')
        vim.keymap.set('n', '<leader>tf', ':Neotree toggle float<CR>')
        vim.keymap.set('n', '<leader>f', ':Neotree toggle focus<CR>')
        vim.keymap.set('n', '<leader>pv', ':Neotree reveal<CR>') -- see file in tree
    end,
}
