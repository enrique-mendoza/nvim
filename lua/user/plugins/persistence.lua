local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } 
  },
  -- stylua: ignore
}

function M.config()
  require("persistence").setup {
    dir = vim.fn.stdpath "data" .. "/sessions/", -- directory where session files are saved
    -- minimum number of file buffers that need to be open to save
    -- Set to 0 to always save
    need = 1,
    branch = false, -- use git branch to save session
  }
end

return M
