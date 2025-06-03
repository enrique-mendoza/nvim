local M = {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
}

function M.config()
  local nvim_tmux_nav = require "nvim-tmux-navigation"
  local keymap = vim.keymap.set

  nvim_tmux_nav.setup {
    disable_when_zoomed = true, -- defaults to false
  }

  keymap("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
  keymap("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
  keymap("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
  keymap("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  keymap("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
  keymap("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
end

return M
