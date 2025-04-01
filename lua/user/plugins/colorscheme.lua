local M = require "user.themes.astrotheme"

function M.config()
  require("astrotheme").setup {}

  vim.cmd.colorscheme "astrodark"
end

return M
