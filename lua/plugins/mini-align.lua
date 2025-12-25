local M = {
  "echasnovski/mini.align",
  version = false,
  event = "VeryLazy",
}

function M.config()
  require("mini.align").setup()
end

return M
