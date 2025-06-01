local M = {
  "echasnovski/mini.splitjoin",
  version = false,
  event = "VeryLazy",
}

function M.config()
  require("mini.splitjoin").setup {
    mappings = { toggle = "" }, -- Disable default mapping
  }

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap({ "n", "x" }, "sj", ":lua MiniSplitjoin.join()<cr>", opts)
  keymap({ "n", "x" }, "sk", ":lua MiniSplitjoin.split()<cr>", opts)
end

return M
