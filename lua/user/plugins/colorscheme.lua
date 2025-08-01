local M = require "user.plugins.colorschemes.astrotheme"

function M.config()
  require("astrotheme").setup {}

  vim.cmd.colorscheme "astrodark"
end

return M
