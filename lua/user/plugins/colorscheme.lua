local M = require "user.plugins.colorschemes.catppuccin"

function M.config()
  require("catppuccin").setup {}

  vim.cmd.colorscheme "catppuccin"
end

return M
