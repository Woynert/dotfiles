local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')
lsp_config.dartls.setup{}
lsp_config.clangd.setup{}

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)

-- From https://lsp-zero.netlify.app/v3.x/language-server-configuration.html#default-keybindings
--[[
    K: vim.lsp.buf.hover() Displays hover information about the symbol under the cursor in a floating window
    gl: vim.diagnostic.open_float() Show diagnostics in a floating window

    gd: vim.lsp.buf.definition() Jumps to the definition of the symbol under the cursor
    gD: vim.lsp.buf.declaration() Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature
    gi: vim.lsp.buf.implementation() Lists all the implementations for the symbol under the cursor in the quickfix window
    
    go: vim.lsp.buf.type_definition() Jumps to the definition of the type of the symbol under the cursor
    gr: vim.lsp.buf.references() Lists all the references to the symbol under the cursor in the quickfix window
    gs: vim.lsp.buf.signature_help() Displays signature information about the symbol under the cursor in a floating window
    <F2>: vim.lsp.buf.rename() Renames all references to the symbol under the cursor
    <F3>: vim.lsp.buf.format() Format code in current buffer
    <F4>: vim.lsp.buf.code_action() Selects a code action available at the current cursor position
    [d: vim.diagnostic.goto_prev() Move to the previous diagnostic in the current buffer
    ]d: vim.diagnostic.goto_next() Move to the next diagnostic
--]]
