local M = require "user.themes.tokyonight"

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
  require("tokyonight").setup {
    style = "day"
  }

  vim.cmd.colorscheme "tokyonight"
end

return M
