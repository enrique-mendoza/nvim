local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

function M.config()
  require("flash").setup {
    modes = {
      char = {
        keys = { "f", "F", "t", "T" },
      },
    },
  }
end

return M
