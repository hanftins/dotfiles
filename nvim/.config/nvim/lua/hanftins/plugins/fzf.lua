return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			fzf_opts = {
				["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
			},
			fzf_colors = {
				["hl"] = { "Normal" }, -- Inherit from Neovim's Visual highlight
				["hl+"] = { "Normal", "bold" }, -- Add bold
				-- Auto-generate the rest based on your theme
				true,
			},
			grep = {
				rg_glob = true,
				glob_flag = "--iglob",
				glob_separator = "%s%-%-",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden -g '!.git/'",
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Show all buffers" })
		keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep in cwd" })
	end,
}
