local M = {
  "sphamba/smear-cursor.nvim",
}

function M.config()
  require("smear_cursor").setup({})
end

return M
