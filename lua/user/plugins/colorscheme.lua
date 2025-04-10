local M = require "user.themes.onedarkpro"

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
  require("onedarkpro").setup {}

  vim.cmd.colorscheme "onedark"
end

return M
