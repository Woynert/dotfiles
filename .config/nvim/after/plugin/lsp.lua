local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- how to install and configure new LSPs
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#install-new-language-servers

-- LSPs must be in this list
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers

lsp.ensure_installed({
    'gopls',
    'tsserver',
    --'eslint',
    --'lua_ls',
    --'rust_analyzer',
    --'pylyzer'
})

-- mapings

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    preselect = 'none',
    completion = {
        --completeopt = 'menu,menuone,noinsert,noselect'
        completeopt = 'menu,menuone,noselect'
    },
    experimental = {
        ghost_text = true,
    },
})

-- (Optional) Configure lua language server for neovim

lsp.nvim_workspace()
lsp.setup()

-- Custom language servers

-- dart

require('lspconfig').dartls.setup{}

-- python

--require'lspconfig'.pylyzer.setup{}
--require'lspconfig'.pylsp.setup{
  --settings = {
    --pylsp = {
      --plugins = {
        --pycodestyle = {
          --enabled = false
        --}
      --}
    --}
  --}
--}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = false, -- true
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})
