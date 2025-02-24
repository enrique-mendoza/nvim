local M = {
  "nvchad/showkeys",
}

function M.config()
  require("showkeys").setup {
    position = "top-right", -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
  }
end

return M
