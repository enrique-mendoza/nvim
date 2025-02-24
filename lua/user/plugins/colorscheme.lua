local M = require "user.themes.tokyonight"

function M.config()
  require("tokyonight").setup {
    style = "night",
    lualine_bold = true,
  }

  vim.cmd.colorscheme "tokyonight"
end

return M
