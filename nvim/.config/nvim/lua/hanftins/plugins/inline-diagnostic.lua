return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
			-- hi = {
			-- 	-- Optional: Customize mixing color for better blending (e.g., a light gray/white to match your theme)
			-- 	-- Format: "#RRGGBB" (hex without alpha)
			-- 	mixing_color = "#FFFFFF", -- White for light themes; adjust to your bg color like "#F0F0F0"
			-- },
			options = {
				multilines = {
					enabled = true,
				},
			},
		})
		vim.diagnostic.config({
			signs = false,
			virtual_text = false,
		}) -- Disable default virtual text
	end,
}
