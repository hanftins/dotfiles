return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,  -- Enable icons (requires nvim-web-devicons)
        theme = 'auto',        -- Auto-detect from your colorscheme
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str) return str:sub(1,1) end
          }
        },  -- Mode (NORMAL, INSERT, etc.)
        lualine_b = {
          'branch',              -- Git branch
          'diff',                -- Git diff (+/-/~)
          {
            'diagnostics',       -- LSP diagnostics
            update_in_insert = true,  -- Update during insert mode
          }
        },
        lualine_c = {
          {
            'filename',
            path = 1,              -- Relative path
            shorting_target = 40,  -- Shorten long paths
            symbols = {
              modified = '●',     -- Icon for modified files
              readonly = ' ',
              unnamed = 'Untitled',
            },
          }
        },
        lualine_x = { 'encoding', { 'fileformat', symbols = { unix = "" } }, 'filetype' },  -- File info
        lualine_y = { 'progress' },  -- Scroll progress
        lualine_z = { 'location' }   -- Line/column
      },
      extensions = { 'quickfix', 'fzf' }  -- Optional: Enable for quickfix and fzf
    })
  end,
}
