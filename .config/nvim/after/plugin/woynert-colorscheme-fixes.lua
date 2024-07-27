local fix_scheme = function ()
  local scheme_name = vim.g.colors_name or "unknown"
  --print("Colorscheme changed to: " .. (scheme_name))

  if scheme_name == "edge" then
    local hl_name = ''
    local hl_prev = nil
    local hl = nil
    local DarkBackground = "#1C1C1C"

    -- background

    if vim.o.background == "dark" then
      vim.api.nvim_set_hl(0, 'normal', { bg = DarkBackground }) 
    end

    -- markdown code block

    if vim.o.background == "dark" then
      vim.api.nvim_set_hl(0, 'MDCodeBlock', {
          background = ColorBlender.blend_hex( DarkBackground, "#0000FF", 0.90)
        })
    elseif vim.o.background == "light" then
      vim.api.nvim_set_hl(0, 'MDCodeBlock', {
          background = ColorBlender.blend_hex( "#FFFFFF", "#FFFF00", 0.9)
        })
    end

    -- mini tabline

    hl_name = 'MiniTablineCurrent'
    hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    vim.api.nvim_set_hl(0, hl_name, { bg = hl.foreground, fg = hl.background })

    hl_name = 'MiniTablineHidden'
    hl_prev = hl
    hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    vim.api.nvim_set_hl(0, hl_name, { bg = hl.background, fg = hl_prev.foreground })

    hl_name = 'MiniTablineModifiedCurrent'
    hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    vim.api.nvim_set_hl(0, hl_name, { bg = hl.foreground, fg = hl.background })

    hl_name = 'MiniTablineModifiedHidden'
    vim.api.nvim_set_hl(0, hl_name, { bg = hl.background, fg = hl.foreground })

    -- commas and parentesis

    --hl_name = '@punctuation.delimiter'
    --hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    --vim.api.nvim_set_hl(0, '@punctuation.bracket', { bg = hl.background, fg = hl.foreground })

  end
end

-- Custom autocommand

local group = vim.api.nvim_create_augroup('ColorSchemeChange', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = group,
  callback = fix_scheme,
})

-- Call once on start
fix_scheme()
