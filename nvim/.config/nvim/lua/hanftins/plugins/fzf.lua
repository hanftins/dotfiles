return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      fzf_opts = {
        ['--history'] = vim.fn.stdpath('data') .. '/fzf-lua-history'
      },
      fzf_colors = {
        ["hl"]      = { "Normal" },  -- Inherit from Neovim's Visual highlight
        ["hl+"]     = { "Normal", "bold" },  -- Add bold
        -- Auto-generate the rest based on your theme
        true,
      },
      -- Configuration options for fzf-lua
      filetypes = { "swift" },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>", { desc = "Show all buffers" })
    keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", { desc = "Live grep in cwd" })
  end,
}
