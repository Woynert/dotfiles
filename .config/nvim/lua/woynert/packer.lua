-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- PackerSync

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
	use('mbbill/undotree')
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

    use { 'morhetz/gruvbox',
        as = 'gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    }

    use { 'ap/vim-buftabline',
        config = function()
            vim.g.buftabline_show = true
            vim.g.buftabline_indicators = true
        end
    }

    use { 'echasnovski/mini.starter', branch = 'stable',
        config = function()
            local starter = require('mini.starter')
            starter.setup({
                items = {
                    starter.sections.recent_files(10, true),
                    starter.sections.recent_files(20, false),
                    --starter.sections.builtin_actions(),
                    -- Use this if you set up 'mini.sessions'
                    --starter.sections.sessions(5, true)
                },
            })
        end
    }

    use { 'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)


