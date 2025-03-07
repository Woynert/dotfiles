-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- :PackerSync

-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    --- core ---

    use 'wbthomason/packer.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            --{'hrsh7th/cmp-nvim-lsp-signature-help'}, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'saadparwaiz1/cmp_luasnip' }, -- Used by LuaSnip and nvim-cmp
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Pkg manager
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        },
    }

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup(cfg)
        end,
    }

    -- formatting

    use { 'stevearc/conform.nvim', branch = 'nvim-0.9' }

    use {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.3', -- neovim 0.9.2 or later
        run = ':TSUpdate',
    }

    use 'nvim-treesitter/playground'

    --use('mbbill/undotree')

    use {
        'timakro/vim-yadi',

        -- TODO: BUG
        -- When opening an empty python file with some commments on it, this plugin will set the tab
        -- width value to be 91 columns, fix -> configure a limit tab value

        -- auto detect at file events
        config = function()
            vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost', 'BufFilePost' }, {
                pattern = '*',
                command = 'DetectIndent',
            })
        end,
    }

    --- UI tools ---

    use 'liuchengxu/vim-which-key'

    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not required, but recommended
            'MunifTanjim/nui.nvim',
        },
    }

    use {
        'lewis6991/gitsigns.nvim',
        --tag = 'release',
        --config = function()
        --require('gitsigns').setup()
        --end
    }

    use {
        'ValJed/marks.nvim',
        branch = 'feat-telescope-support-for-listing-marks',
    }

    use {
        'echasnovski/mini.tabline',
        config = function()
            require('mini.tabline').setup {
                format = function(buf_id, label)
                    local suffix = vim.bo[buf_id].modified and '+ ' or ''
                    return MiniTabline.default_format(buf_id, label) .. suffix
                end,
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    --use { 'woynert/mini.map',
    use {
        'echasnovski/mini.map',
        config = function()
            local map = require 'mini.map'
            map.setup {
                integrations = {
                    map.gen_integration.builtin_search(),
                    map.gen_integration.gitsigns(),
                    map.gen_integration.diagnostic(), -- code errors, warnings
                },
                symbols = {
                    encode = map.gen_encode_symbols.dot '4x2',
                },
            }
            vim.keymap.set('n', '<leader>m', function()
                MiniMap.toggle()
            end)
        end,
        requires = { 'lewis6991/gitsigns.nvim' },
    }

    --- visual ---

    use 'NLKNguyen/papercolor-theme'
    use 'sainnhe/edge'

    use {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            require('rainbow-delimiters.setup').setup()
        end,
    }

    use {
        'psliwka/vim-smoothie',
        config = function()
            --vim.g.smoothie_update_interval = 10
            --vim.g.smoothie_speed_constant_factor = 60
            vim.g.smoothie_speed_linear_factor = 60
            vim.g.smoothie_speed_exponentiation_factor = 0.5
        end,
    }

    use {
        'echasnovski/mini.cursorword',
        as = 'mini.cursorword',
        config = function()
            require('mini.cursorword').setup {
                delay = 200,
            }
        end,
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }

    -- markdown headlines
    use {
        'woynert/headlines.nvim',
        branch = 'refactor/wip',
        after = 'nvim-treesitter',
        config = function()
            require('headlines').setup()
        end,
    }

    -- markdown codeblocks
    use {
        'yaocccc/nvim-hl-mdcodeblock.lua',
        after = 'nvim-treesitter',
        config = function()
            require('hl-mdcodeblock').setup {
                -- option
                minumum_len = 30,
            }
        end,
    }

    -- misc tools

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' },
        },
    }

    use { 'LinArcX/telescope-command-palette.nvim' }

    use 'olacin/telescope-gitmoji.nvim'

    use {
        'preservim/nerdcommenter',
        config = function()
            vim.g.NERDCreateDefaultMappings = true
        end,
    }

    use 'tpope/vim-fugitive'

    use {
        'simeji/winresizer',
        config = function()
            vim.g.winresizer_start_key = '<C-w>e'
        end,
    }

    use {
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end,
        config = function()
            -- Do not autoclose after switching buffers
            vim.g.mkdp_auto_close = 0
            -- Reuse current open tab when switching buffers
            vim.g.mkdp_combine_preview = 1
            -- Use chromium
            vim.g.mkdp_browser = 'chromium'
        end,
    }

    -- sudo write
    use 'lambdalisue/suda.vim'

    use {
        'dhruvasagar/vim-prosession',
        requires = {
            { 'tpope/vim-obsession' },
        },
        config = function()
            require('telescope').load_extension 'prosession'
            vim.keymap.set('n', '<Leader>z', '<cmd>Telescope prosession<CR>')
        end,
    }

    -- outline
    use {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup {
                -- global floating
                attach_mode = 'global',
                layout = {
                    default_direction = 'float',
                    placement = 'edge',
                },
                float = {
                    relative = 'editor',
                },

                -- remap p to o, navigate to without closing window
                keymaps = {
                    ['o'] = 'actions.scroll',
                },
            }
            vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>')
        end,
    }
end)
