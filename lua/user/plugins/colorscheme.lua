local M = require("user.themes.eldritch")

function M.config()
  require("eldritch").setup({})

  vim.cmd.colorscheme "eldritch"
end

return M
