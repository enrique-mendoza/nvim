local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("kanagawa").setup {
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
  }
end

return M
