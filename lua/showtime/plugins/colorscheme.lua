local M = require "showtime.plugins.themes.catppuccin"

-- local function syncOs()
--   local hr = tonumber(os.date("%H", os.time()))
--
--   if hr > 6 and hr < 21 then -- day between 6am and 9pm
--     return "day"
--   end
--
--   vim.notify "󱫍 Time to update your theme!"
--
--   return "night"
-- end

function M.config()
  require("catppuccin").setup {
    flavour = "frappe", -- latte, frappe, macchiato, mocha
  }

  vim.opt.background = "dark"
  vim.cmd.colorscheme "catppuccin"
end

return M
