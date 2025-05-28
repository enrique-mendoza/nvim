local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "BufEnter",
}

function M.config()
  require("hardtime").setup {}
end

return M
