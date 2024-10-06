local M = {
  "folke/drop.nvim",
  opts = {}
}

function M.config()
  require("drop").setup({})
end

return M
