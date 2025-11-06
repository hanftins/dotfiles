return {
	{
		"echasnovski/mini.nvim",
		version = false, -- always latest
		config = function()
			require("mini.files").setup({
				windows = {
					preview = true,
					width_focus = 70,
					width_preview = 70,
				},
				content = {
					prefix = function(fs_entry)
						local stat = vim.loop.fs_stat(fs_entry.path)
						if not stat then
							return ""
						end

						local date_str = os.date("%d %b %Y %H:%M", stat.mtime.sec)
						return string.format("%s ", date_str)
					end,
				},
			})

			vim.keymap.set("n", "<leader>e", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0))
			end, { desc = "open mini.files (current file)" })

			vim.keymap.set("n", "<leader>E", function()
				MiniFiles.open()
			end, { desc = "open mini.files (cwd)" })

			vim.api.nvim_create_autocmd("user", {
				pattern = "MiniFilesWindowUpdate",
				callback = function(args)
					vim.wo[args.data.win_id].relativenumber = true
				end,
			})

			require("mini.statusline").setup({
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 999 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
						local filename = MiniStatusline.section_filename({ trunc_width = 999 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
						local navic_str = require("nvim-navic").get_location()

						return MiniStatusline.combine_groups({
							{ strings = { mode } },
							{ strings = { git, diff, diagnostics, lsp } },
							"%<", -- Mark general truncate point
							{ strings = { filename } },
							"%=", -- End left alignment
							{ strings = { navic_str } },
							{ strings = { fileinfo } },
							{ strings = { search, location } },
						})
					end,
				},
			})

			require("mini.ai").setup()
			require("mini.icons").setup()
			require("mini.sessions").setup()

			vim.keymap.set("n", "<leader>sl", function()
				MiniSessions.select("read")
			end, { desc = "Load Session" })

			vim.keymap.set("n", "<leader>ss", function()
				MiniSessions.write(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
			end, { desc = "Save Session" })

			vim.keymap.set("n", "<leader>sd", function()
				MiniSessions.select("delete")
			end, { desc = "Delete Session" })

			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.cursorword").setup({
				delay = 0,
			})

			local indentscope = require("mini.indentscope")
			indentscope.setup({
				draw = {
					delay = 0,
					animation = indentscope.gen_animation.none(),
				},
			})

			require("mini.trailspace").setup()
		end,
	},
}
