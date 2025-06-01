local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local harpoon = require "harpoon"

  keymap("n", "<s-m>", function()
    harpoon:list():add()
    vim.notify "󱡅 Marked file"
  end, opts)

  keymap("n", "<TAB>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, opts)
end

return M
