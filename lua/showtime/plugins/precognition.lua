local M = {
  "tris203/precognition.nvim",
}

function M.config()
  require("precognition").setup {}

  require("which-key").add {
    {
      "<leader>up",
      "<cmd>Precognition toggle<cr>",
      desc = "Precognition toggle",
    },
  }
end

return M
