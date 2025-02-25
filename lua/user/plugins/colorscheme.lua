local M = require "user.themes.eldritch"

function M.config()
  require("eldritch").setup {
    palette = "darker"
  }

  vim.cmd.colorscheme "eldritch"
end

return M
