local M = require "user.themes.tokyonight"

function M.config()
  require("tokyonight").setup {
    style = "night"
  }

  vim.cmd.colorscheme "tokyonight"
end

return M
