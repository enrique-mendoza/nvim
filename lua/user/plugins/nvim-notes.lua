local M = {
  "itsvinayak/nvim-notes.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Add Telescope as a dependency
  }
}

function M.config()
  require("notes").setup {
    -- Optional configurations
    path = "~/code/personal/life/notes", -- Custom path for notes
    log_enabled = false, -- Enable logging
    log_level = "INFO", -- Set log level to INFO
  }
end

return M
