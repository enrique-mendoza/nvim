-- Colorscheme
local M = {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("cyberdream").setup {
    -- Set light or dark variant
    variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

    -- Enable transparent background
    transparent = false,
  }
end

return M
