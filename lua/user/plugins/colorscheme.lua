local M = require("user.themes.catppuccin")

function M.config()
  require("catppuccin").setup({})

  vim.cmd.colorscheme "catppuccin"
end

return M
