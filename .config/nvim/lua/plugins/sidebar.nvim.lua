function trim12(s)
   local from = s:match"^%s*()"
   return from > #s and "" or s:match(".*%S", from)
end

function echo_warning(msg)
    vim.api.nvim_command("echohl WarningMsg")
    vim.api.nvim_command("echom '[SidebarNvim] " .. msg:gsub("'", "''") .. "'")
    vim.api.nvim_command("echohl None")
end

buffers_highlight_selected = "DiagnosticFloatingError"
buffers_highlight_modified = "DiagnosticWarning"
buffers_highlight_linenr = "LineNr"

return {
        "https://github.com/Woynert/sidebar.nvim",
        --dir = "/plan/2-dev/fork/sidebar.nvim",
		--cmd = { "SidebarNvimToggle", "SidebarNvimClose" },
		config = function()
            tabline = require ('plugins.foo.mini-tabline')
            tabline.config.show_icons = false
            tabs = tabline.get_tab_list()

			local base_info = {
				title = "Info",
				icon = "",
				draw = function()
					local lines = {}

					-- Mode
					local modes = {
						["n"] = "Normal",
						["no"] = "N·Operator Pending",
						["v"] = "Visual",
						["V"] = "V·Line",
						[""] = "V·Block",
						["s"] = "Select",
						["S"] = "S·Line",
						[""] = "S·Block",
						["i"] = "Insert",
						["R"] = "Replace",
						["Rv"] = "V·Replace",
						["c"] = "Command",
						["cv"] = "Vim Ex",
						["ce"] = "Ex",
						["r"] = "Prompt",
						["rm"] = "More",
						["r?"] = "Confirm",
						["!"] = "Shell",
						["t"] = "Terminal",
					}
					local mode = vim.fn.mode()
					local mode_name = modes[mode]
					table.insert(lines, (mode_name and mode_name or "undefined") .. " mode")

					-- Git branch
					if vim.fn.isdirectory(".git") then
						local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
						if branch ~= "" then
							table.insert(lines, "branch: " .. branch)
						end
					end

					return {
						lines = lines,
					}
				end,
			}

            -- ============================================================
            -- Custom Buffers (sidebar.nvim) Plugin
            -- ============================================================

            local line_to_buffer_id = {}
            local buffers_open_file = function(line, focus)
                local buffer_id = line_to_buffer_id[line + 1] 
                if buffer_id == nil then return end

                vim.cmd("wincmd p")
                vim.cmd("b " .. buffer_id)
                if focus == true then sidebar_nvim.focus() end
            end


			local buffers = {
				title = "Buffers",
				icon = "",
				draw = function(ctx)
                    line_to_buffer_id = {}

					local lines = {}
					local hl = {}
                    local y_offset = 0
                    local tabs = tabline.get_tab_list()
                    local bufid_column_width = 1
                    if #tabs >= 10 then bufid_column_width = 2 end

                    table.sort(tabs, function(a, b) return a.label:lower() < b.label:lower() end)

					for i, buf in ipairs(tabs) do
						if buf.label:find("^term://") ~= nil or buf.label == "" then
							goto continue
						end

                        local is_selected = buf.buf_id == vim.api.nvim_get_current_buf()
                        local is_modified = false
                        if is_selected then
                            table.insert(hl, { buffers_highlight_selected, i -1 + y_offset, 0, -1 })
                        else
                            is_modified = vim.api.nvim_buf_get_option(buf.buf_id, "modified")
                            if is_modified then
                                table.insert(hl, { buffers_highlight_modified, i -1 + y_offset, 0, -1 })
                            end
                        end

                        table.insert(hl, { buffers_highlight_linenr, i -1 + y_offset, 0, 2 })

                        local full_buffer_string = string.format("%" .. tostring(bufid_column_width) .. "d", buf.buf_id) .. " " .. trim12(buf.label)

                        if full_buffer_string:len() <= (ctx.width + 2) then
                            table.insert(lines, full_buffer_string)
                            line_to_buffer_id[i + y_offset] = buf.buf_id
                        else
                            table.insert(lines, full_buffer_string:sub(1, ctx.width))
                            table.insert(lines, string.rep(" ", 1 + bufid_column_width) .. full_buffer_string:sub(ctx.width+1, -1))
                            y_offset = y_offset + 1

                            if is_selected then
                                table.insert(hl, { buffers_highlight_selected, i -1 + y_offset, 0, -1 })
                            elseif is_modified then
                                table.insert(hl, { buffers_highlight_modified, i -1 + y_offset, 0, -1 })
                            end

                            line_to_buffer_id[i + y_offset - 1] = buf.buf_id
                            line_to_buffer_id[i + y_offset] = buf.buf_id
                        end


						::continue::
					end

					return {
						lines = lines,
                        hl = hl,
					}
				end,
                bindings = {
                    ["p"] = function(line) buffers_open_file(line, true) end,
                    ["e"] = function(line) buffers_open_file(line, false) end,
                    ["o"] = function(line) buffers_open_file(line, false) end,
                    ["d"] = function(line)
                        local buffer_id = line_to_buffer_id[line + 1] 
                        if buffer_id == nil then return end

                        local is_modified = vim.api.nvim_buf_get_option(buffer_id, "modified")
                        if is_modified then
                            echo_warning("Not closing, buffer has been modified.")
                        else
                            vim.api.nvim_buf_delete(buffer_id, {})
                        end
                    end,
                },
			}

            sidebar_nvim = require("sidebar-nvim")
			sidebar_nvim.setup({
                side = "right",
                section_separator = "",
                section_title_separator = "",
                initial_width = 30,
                --hide_statusline = true,

				sections = {
                    --"buffers",
                    buffers,
                    --base_info,
                    --terms,
                    --harpoon_marks
                    --"datetime",
                    --"git",
                    --"diagnostics",
                    --"containers",
                    --"files",
                    --"symbols"
                    --"todos"
                },

                buffers = {
                    icon = "",
                    ignored_buffers = {}, -- ignore buffers by regex
                    sorting = "name", -- "id" | "name"
                    show_numbers = true, -- whether to also show the buffer numbers
                    ignore_not_loaded = false, -- whether to ignore not loaded buffers
                    ignore_terminal = true, -- whether to show terminal buffers in the list
                }
			})

            vim.api.nvim_create_autocmd(
                {
                    "BufAdd", "BufDelete", "BufEnter",
                    --"TabEnter",
                    --"ModeChanged", "DiagnosticChanged"
                },
                {
                    callback = function()
                        sidebar_nvim.update()
                    end,
                }
            )

            -- shortcuts

            vim.keymap.set('n', '<leader>b', sidebar_nvim.toggle)
		end,
	}
