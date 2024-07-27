require'nvim-treesitter.configs'.setup {
  -- A list of parser names
  ensure_installed = {
    "bash", "gitignore",
    "c", "cpp",
    "lua", "vim", "vimdoc",
    "markdown", "markdown_inline",
    "javascript", "typescript", "json", "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}


