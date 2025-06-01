local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = {
    "DiffviewFileHistory",
    "DiffviewOpen",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
}

function M.config()
  local wk = require "which-key"

  wk.add {
    {
      "<leader>gd",
      "<cmd>DiffviewOpen<cr>",
      desc = "Git Diff",
      icon = {
        icon = " ",
        color = "orange",
      },
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "Git Diff File History",
      icon = {
        icon = " ",
        color = "orange",
      },
    },
  }
end

return M
