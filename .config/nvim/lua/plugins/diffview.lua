return {
    "sindrets/diffview.nvim",
    opts = {
      hooks = {
        diff_buf_win_enter = function()
          vim.opt_local.foldenable = false
        end,

        diff_buf_read = function(buffnr)
          --https://github.com/sindrets/diffview.nvim/issues/539
          --vim.api.nvim_buf_call(buffnr, function()
            ----vim.cmd("normal! gg]czz")
            ----print("Hello there")
            ----vim.cmd(":echo expand('%:p')")
            ----vim.cmd("normal ]c")
            ----require("gitsigns").next_hunk()
          --end)
            --vim.cmd(":execute 2 'wincmd w'")
            -- vim.cmd(":call win_gotoid(win_getid(3))")
            --vim.cmd(":echo win_getid(3)")
        end,
      }, 

      file_panel = {
        listing_style = "list",             -- One of 'list' or 'tree'
        --tree_options = {                    -- Only applies when listing_style is 'tree'
          --flatten_dirs = true,              -- Flatten dirs that only contain one single dir
          --folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
        --},
        win_config = {                      -- See |diffview-config-win_config|
          position = "right",
          --width = 35,
          --win_opts = {},
        },
      },

    }
}
