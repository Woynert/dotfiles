-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- :PackerSync

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'},
		}
	}

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

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('ThePrimeagen/harpoon')
	--use('mbbill/undotree')
	use('tpope/vim-fugitive')

    use { 'preservim/nerdcommenter',
        config = function()
            vim.g.NERDCreateDefaultMappings = true
        end
    }

    use { 'luochen1990/rainbow',
        config = function()
            vim.g.rainbow_active = true
            vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
        end
    }

    use { 'lifepillar/vim-gruvbox8',
        as = 'gruvbox8',
        config = function()
            --set background=dark
            vim.cmd('colorscheme gruvbox8')
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

    use { 'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    }

    use 'olacin/telescope-gitmoji.nvim'

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

    use 'psliwka/vim-smoothie'

    use { 'timakro/vim-yadi',

        -- auto detect at file events
        config = function ()
            vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost", "BufFilePost"}, {
              pattern = '*',
              command = 'DetectIndent',
            })
        end
    }

end)


