return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
	},
	config = function()
		local xcodebuild = require("xcodebuild.integrations.dap")
		-- SAMPLE PATH, change it to your local codelldb path
		local codelldbPath = os.getenv("HOME") .. "/tools/codelldb-darwin-arm64/extension/adapter/codelldb"

		xcodebuild.setup(codelldbPath)

		vim.keymap.set("n", "<F5>", require("dap").continue)
		vim.keymap.set("n", "<F10>", require("dap").step_over)
		vim.keymap.set("n", "<F11>", require("dap").step_into)
		vim.keymap.set("n", "<F12>", require("dap").step_out)
		vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint)
	end,
}
