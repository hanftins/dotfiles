return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"MunifTanjim/nui.nvim",
		"stevearc/oil.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("xcodebuild").setup({
      logs = {
        auto_open_on_failed_build = false
      },
			integrations = {
				pymobiledevice = {
					enabled = true,
				},
			},
		})

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
    vim.keymap.set("n", "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })
	end,
}
