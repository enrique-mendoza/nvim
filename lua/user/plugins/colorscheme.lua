local M = require "user.plugins.colorschemes.onedarkpro"

function M.config()
  require("onedarkpro").setup {}

  vim.cmd.colorscheme "onedark"
end

return M
