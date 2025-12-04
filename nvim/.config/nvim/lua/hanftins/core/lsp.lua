-- 1. Create an Autocommand for Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- Helper to set keymaps cleanly
		local map = function(mode, lhs, rhs, desc)
			opts.desc = desc
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- -- Keybindings --
		map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", "Show LSP definitions")
		map("n", "gD", "<cmd>vsplit | FzfLua lsp_definitions<cr>", "Show LSP definitions in split")
		map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "Show LSP references")
		map("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", "Show LSP implementation")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Show LSP code actions")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
		map("n", "<leader><leader>d", "<cmd>FzfLua diagnostics_document<cr>", "Show buffer diagnostics")
		map("n", "<leader><leader>l", vim.diagnostic.open_float, "Show line diagnostics")
		map("n", "<leader><leader>w", "<cmd>FzfLua diagnostics_workspace<cr>", "Show workspace diagnostics")
		map("n", "K", vim.lsp.buf.hover, "Show documentation")

		-- Diagnostic Jumps
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
			vim.cmd("normal! zz")
		end, "Go to previous diagnostic")

		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
			vim.cmd("normal! zz")
		end, "Go to next diagnostic")

		-- Navic Setup
		if client.server_capabilities.documentSymbolProvider then
			local ok, navic = pcall(require, "nvim-navic")
			if ok then
				navic.attach(client, bufnr)
			end
		end
	end,
})

-- 2. Define the LSP Configuration
vim.lsp.config("sourcekit", {
	cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) },
	-- Native 0.11 requires manual filetypes
	filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
	-- Native 0.11 requires manual root markers (files that define the project root)
	root_markers = { "Package.swift", ".git", "buildServer.json", "*.xcodeproj", "*.xcworkspace" },
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- 3. Enable the Server
vim.lsp.enable("sourcekit")
