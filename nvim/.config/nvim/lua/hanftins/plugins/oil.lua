return {
  "stevearc/oil.nvim",
  opts = {},  -- Optional: Customize options here (see GitHub for full docs)
  -- Optional dependencies for icons
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },  -- Or use "nvim-mini/mini.icons" instead
  },
  -- Lazy loading can be tricky; disable it for reliability
  lazy = false,
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-h>"] = false,  -- Disable the horizontal split action
        ["<C-l>"] = false,  -- Disable the horizontal split action
      },
      default_file_explorer = true,  -- Auto-open on directory buffers
      columns = { "icon", "permissions", "size", "mtime" },  -- Customize view
      delete_to_trash = true,
      view_options = { 
        natural_order = true,
        show_hidden = true 
      },  -- Show hidden files
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
