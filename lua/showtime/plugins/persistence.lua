local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
  },
  -- stylua: ignore
}

function M.config()
  local persistence = require "persistence"

  persistence.setup {
    dir = vim.fn.stdpath "data" .. "/sessions/", -- directory where session files are saved
    -- minimum number of file buffers that need to be open to save
    -- Set to 0 to always save
    need = 1,
    branch = false, -- use git branch to save session
  }

  require("which-key").add {
    {
      "<leader>Sf",
      function()
        persistence.select()
      end,
      desc = "Select Session",
    },
    {
      "<leader>Sl",
      function()
        persistence.load { last = true }
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>Sr",
      function()
        persistence.load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>Ss",
      function()
        persistence.stop()
      end,
      desc = "Don't Save Current Session",
    },
  }
end

return M
