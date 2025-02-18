local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  local banned_messages = { "No information available" }

  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require "notify"(msg, ...)
  end

  require("notify").setup({
    timeout = 10000,
    render = "compact",
    fps = 144
  })
end

return M
