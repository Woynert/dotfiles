local SwapBuffers = {
  config = {
    ignore_filetypes = {'NvimTree'}
  }
}

function SwapBuffers.setup(config)
  if config ~= nil then
    SwapBuffers.config = vim.tbl_deep_extend("force", SwapBuffers.config, config)
  end
end

function SwapBuffers.swap_buffers(with)
  if string.match(with, "[hjkl]") then
    local target_window = vim.fn.win_getid(vim.fn.winnr(with))
    SwapBuffers.swap_buffers_windows(target_window)
  else
    print("argument needs to be one of [hjkl]")
  end
end

function SwapBuffers.swap_buffers_windows(target_window)
  local target_buffer = vim.api.nvim_win_get_buf(target_window)
  local target_filetype = vim.api.nvim_buf_get_option(target_buffer, 'filetype')
  local current_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  local ignore = SwapBuffers.config.ignore_filetypes

  if not (vim.tbl_contains(ignore, target_filetype) or vim.tbl_contains(ignore, current_filetype)) then

    local current_window = vim.fn.win_getid()
    local current_buffer = vim.fn.bufnr()
    local current_buffer_cursor = vim.api.nvim_win_get_cursor(0)
    local target_buffer_cursor = vim.api.nvim_win_get_cursor(target_window)

    vim.cmd("b " .. target_buffer)
    vim.fn.win_gotoid(target_window)
    vim.cmd("b " .. current_buffer)

    vim.api.nvim_win_set_cursor(current_window, target_buffer_cursor)
    vim.api.nvim_win_set_cursor(target_window, current_buffer_cursor)
  end
end

return SwapBuffers
