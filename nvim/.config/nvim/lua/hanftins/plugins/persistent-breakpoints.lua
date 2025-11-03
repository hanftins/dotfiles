return {
	"Weissle/persistent-breakpoints.nvim",
	config = function()
		require("persistent-breakpoints").setup({
			load_breakpoints_event = { "BufReadPost" },
		})
		vim.keymap.set("n", "<F9>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>")
	end,
}
