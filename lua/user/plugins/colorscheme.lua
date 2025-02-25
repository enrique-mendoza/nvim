local M = require "user.themes.cyberdream"

function M.config()
  require("cyberdream").setup {}

  vim.cmd.colorscheme "cyberdream"
end

return M
