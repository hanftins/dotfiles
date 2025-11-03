return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
	},
	config = function()
		local xcodebuild = require("xcodebuild.integrations.dap")
		xcodebuild.setup()

		vim.keymap.set("n", "<F5>", require("dap").continue)
		vim.keymap.set("n", "<F6>", require("dap").terminate)
		vim.keymap.set("n", "<F10>", require("dap").step_over)
		vim.keymap.set("n", "<F11>", require("dap").step_into)
		vim.keymap.set("n", "<F12>", require("dap").step_out)
	end,
}
