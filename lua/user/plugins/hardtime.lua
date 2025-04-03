local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
}

function M.config()
  require("hardtime").setup()
end

return M
