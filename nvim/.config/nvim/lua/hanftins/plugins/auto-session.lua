return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_save_enabled = true,
      auto_restore_enabled = true,
      autosave_last_session = false,
      -- Configure the session picker to use fzf-lua
      session_lens = {
        load_on_setup = true,  -- Load the picker extension on startup
        picker = "fzf",        -- Explicitly set to fzf-lua (auto-detected if fzf-lua is installed)
        -- Optional: Customize fzf-lua options for the session picker
        picker_opts = {
          -- Example: Customize prompt, preview, or actions
          previewer = "bat",  -- Use bat for session file previews (if installed)
          layout = { width = 0.8, height = 0.6 },
        },
      },
    })
    vim.keymap.set("n", "<leader>ls", ":AutoSession search<CR>", { desc = "Load session" })
    vim.keymap.set("n", "<leader>ss", ":AutoSession save<CR>", { desc = "Save session" })
  end,
}
