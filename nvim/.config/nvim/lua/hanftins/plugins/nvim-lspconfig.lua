return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybindings
			local opts = { desc = "" } -- Initialize opts table for keymap descriptions

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", opts)

			opts.desc = "Show LSP definitions in split"
			vim.keymap.set("n", "gD", "<cmd>vsplit | FzfLua lsp_definitions<cr>", opts)

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", opts)

			opts.desc = "Show LSP implementation"
			vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", opts)

			opts.desc = "Show LSP code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader><leader>d", "<cmd>FzfLua diagnostics_document<cr>", opts)

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader><leader>l", vim.diagnostic.open_float, opts)

			opts.desc = "Show workspace diagnostics"
			vim.keymap.set("n", "<leader><leader>w", "<cmd>FzfLua diagnostics_workspace<cr>", opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
				vim.cmd("normal! zz")
			end, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
				vim.cmd("normal! zz")
			end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rl", ":LspRestart | LspStart<CR>", opts)

			if client.server_capabilities.documentSymbolProvider then
				local navic = require("nvim-navic")
				navic.attach(client, bufnr)
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		vim.lsp.enable("sourcekit")
		vim.lsp.config("sourcekit", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) },
		})
	end,
}
