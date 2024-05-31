-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- :PackerSync

-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- core

	use 'wbthomason/packer.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'}, -- Required

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-buffer'},   -- Optional
			{'hrsh7th/cmp-path'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
            {'saadparwaiz1/cmp_luasnip'},     -- Used by LuaSnip and nvim-cmp
			{'rafamadriz/friendly-snippets'}, -- Optional

            -- Pkg manager
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
		}
	}

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use 'nvim-treesitter/playground'

	--use('mbbill/undotree')

    use { 'timakro/vim-yadi',

        -- auto detect at file events
        config = function ()
            vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost", "BufFilePost"}, {
              pattern = '*',
              command = 'DetectIndent',
            })
        end
    }

    -- UI aid

    use 'liuchengxu/vim-which-key'

    use { 'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not required, but recommended
            "MunifTanjim/nui.nvim",
        },
    }

    use {
      'lewis6991/gitsigns.nvim',
      --tag = 'release',
      config = function()
        require('gitsigns').setup()
      end
    }

    --use {
        --'airblade/vim-gitgutter'
    --}

    use { 'echasnovski/mini.tabline',
        config = function ()
            require('mini.tabline').setup()
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use { 'woynert/mini.map',
        config = function()
            local map = require('mini.map')
            map.setup({
                integrations = {
                    map.gen_integration.builtin_search(),
                    map.gen_integration.gitsigns(),
                    map.gen_integration.diagnostic(), -- code errors, warnings
                },
                symbols = {
                    encode = map.gen_encode_symbols.dot('4x2'),
                }
            })
            vim.keymap.set("n", "<leader>m", function() MiniMap.toggle() end)
        end,
        requires = { "lewis6991/gitsigns.nvim" }
    }

    -- TODO: A plugin to list recent files
    --use { 'echasnovski/mini.starter',
        --config = function()
            --local starter = require('mini.starter')
            --starter.setup({
                --items = {
                    --starter.sections.recent_files(10, true),
                    --starter.sections.recent_files(20, false),
                --},
            --})
        --end
    --}

    -- visual

    --use { 'lifepillar/vim-gruvbox8',
        --setup = function()
            ----let g:gruvbox_plugin_hi_groups = 1
          --vim.g.gruvbox_plugin_hi_groups = 1
          ----vim.cmd([[colorscheme gruvbox8]])
        --end
    --}

    --use { 'luochen1990/rainbow',
        --config = function()
            --vim.g.rainbow_active = true
            --vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
        --end
    --}

    --use { 'NLKNguyen/papercolor-theme',
        --setup = function()
          --vim.cmd([[colorscheme PaperColor]])
        --end
    --}

    use { 'NLKNguyen/papercolor-blue',
        requires = { "NLKNguyen/papercolor-theme" }
    }

    use { 'echasnovski/mini.base16',
        setup = function()
          --require('mini.base16').setup()
        end
    }

    use 'psliwka/vim-smoothie'

    use { 'echasnovski/mini.cursorword',
        as = "mini.cursorword",
        config = function ()
            require('mini.cursorword').setup(
                {
                  delay = 100,
                }
            )
        end
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end
    }

    -- tools

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'},
		}
	}

    use { "LinArcX/telescope-command-palette.nvim" }

    use 'olacin/telescope-gitmoji.nvim'

    use { 'preservim/nerdcommenter',
        config = function()
            vim.g.NERDCreateDefaultMappings = true
        end
    }

	use 'tpope/vim-fugitive'

    use {
        'simeji/winresizer',
        config = function ()
            vim.g.winresizer_start_key = '<C-w>e'
        end
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    -- sudo write
    use 'lambdalisue/suda.vim'

	use {
		'dhruvasagar/vim-prosession',
		requires = {
			{'tpope/vim-obsession'},
		},
        config = function ()
            require('telescope').load_extension('prosession')
            vim.keymap.set('n', '<Leader>z', '<cmd>Telescope prosession<CR>')
        end
	}
end)
