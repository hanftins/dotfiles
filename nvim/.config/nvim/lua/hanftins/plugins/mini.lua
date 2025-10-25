return {
	{
		"echasnovski/mini.nvim",
		version = false, -- always latest
		config = function()
			require("mini.files").setup()

			vim.keymap.set("n", "<leader>e", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0))
			end, { desc = "open mini.files (current file)" })

			vim.keymap.set("n", "<leader>E", function()
				MiniFiles.open()
			end, { desc = "open mini.files (cwd)" })

			vim.api.nvim_create_autocmd("user", {
				pattern = "MineFilesWindowUpdate",
				callback = function(args)
					vim.wo[args.data.win_id].relativenumber = true
				end,
			})

			require("mini.statusline").setup({
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
						local navic_str = require("nvim-navic").get_location()

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
							"%<", -- Mark general truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- End left alignment
							{ hl = "MiniStatuslineDevinfo", strings = { navic_str } },
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})

			require("mini.ai").setup()
			require("mini.completion").setup()
			require("mini.snippets").setup()
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

			require("mini.move").setup()
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()

			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})

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
			require("mini.jump").setup()
			require("mini.jump2d").setup()
		end,
	},
}
