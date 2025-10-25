vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Neovim
keymap.set("n", "<esc>", "<cmd>nohl<cr>")
keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Close Neovim" })
keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save Changes" })

-- Clipboard operations
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')
keymap.set("n", "<leader>dd", '"_dd')
keymap.set("n", "<leader>x", '"_x')
keymap.set("n", "<leader>c", '"_c')
keymap.set("v", "<leader>c", '"_c')
keymap.set("n", "<leader>cc", '"_cc')
keymap.set("v", "<leader>p", '"_dP')
keymap.set("n", "<leader>D", '"_D')
keymap.set("n", "<leader>C", '"_C')

-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Change window to right" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Change window to left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Change window to bottom" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Change window to top" })
keymap.set("n", "<C-x>", "<cmd>close<CR>", { desc = "Close current split" })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- resize with arrows
keymap.set("n", "<A-Down>", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
keymap.set("n", "<A-Up>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -4<cr>", { desc = "Smaller vertical split" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })

-- tabs management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- buffers management
keymap.set("n", "<C-]>", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<C-[>", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bn", "<cmd>new<CR>", { desc = "New buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bx", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all buffers but this" })

keymap.set("x", "Y", "y$", { desc = "Yank to end of line" })

-- indenting
keymap.set("v", "<A-h>", "<gv", { desc = "Indent left" })
keymap.set("v", "<A-l>", ">gv", { desc = "Indent right" })
keymap.set("n", "<A-h>", "<<", { desc = "Indent left" })
keymap.set("n", "<A-l>", ">>", { desc = "Indent right" })

-- jumping between issues
keymap.set("n", "<A-d>", "<cmd>silent cc | silent cn<cr>zz", { desc = "Jump to next issue" })
keymap.set("n", "<A-s>", "<cmd>silent cc | silent cp<cr>zz", { desc = "Jump to previous issue" })

keymap.set("n", "gp", "`[v`]")

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 50 })
	end,
})
