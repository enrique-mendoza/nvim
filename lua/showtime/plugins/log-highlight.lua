local M = {
  "fei6409/log-highlight.nvim",
  event = "BufRead *.log",
}

function M.config()
  require("log-highlight").setup {}
end

return M
