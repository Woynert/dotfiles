-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- :PackerSync

-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- auto

	use 'wbthomason/packer.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
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

    use { 'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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

    use { 'echasnovski/mini.tabline',
        config = function ()
            require('mini.tabline').setup()
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use { 'echasnovski/mini.starter',
        config = function()
            local starter = require('mini.starter')
            starter.setup({
                items = {
                    starter.sections.recent_files(10, true),
                    starter.sections.recent_files(20, false),
                },
            })
        end
    }

    -- visual

	--use { 'lifepillar/vim-gruvbox8',
		--setup = function()
		  --vim.cmd([[colorscheme gruvbox8]])
		--end
	--}

	use { 'NLKNguyen/papercolor-theme',
		setup = function()
		  vim.cmd([[colorscheme PaperColor]])
		end
	}

    --use { 'luochen1990/rainbow',
        --config = function()
            --vim.g.rainbow_active = true
            --vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
        --end
    --}

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
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'},
		}
	}

    use { 'preservim/nerdcommenter',
        config = function()
            vim.g.NERDCreateDefaultMappings = true
        end
    }

	use 'tpope/vim-fugitive'

    use 'olacin/telescope-gitmoji.nvim'

    use {
        'simeji/winresizer',
        config = function ()
            vim.g.winresizer_start_key = '<C-w>e'
        end
    }

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    --use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)





