return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("xcodebuild").setup({
			logs = {
				auto_open_on_failed_build = false,
			},
			integrations = {
				pymobiledevice = {
					enabled = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
	end,
}
