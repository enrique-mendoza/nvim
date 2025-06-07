local M = {
  "nvchad/showkeys",
}

function M.config()
  require("showkeys").setup {
    position = "top-right", -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
  }

  require("which-key").add {
    {
      "<leader>uk",
      "<cmd>ShowkeysToggle<cr>",
      desc = "Screenkey toggle",
    },
  }
end

return M
