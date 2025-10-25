return {
	"stevearc/conform.nvim",
	event = { "bufreadpre", "bufnewfile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				swift = { "swiftformat" },
			},
			format_on_save = function()
				return { timeout_ms = 3000, lsp_fallback = true }
			end,
			log_level = vim.log.levels.error,
		})
	end,
}
