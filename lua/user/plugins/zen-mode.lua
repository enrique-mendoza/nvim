local M = {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

function M.config()
  require("zen-mode").setup({})
end

return M
