local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

function M.config()
  require("flash").setup {
    jump = { nohlsearch = true },
    -- prompt = {
    --   win_config = {
    --     border = "none",
    --     -- Place the prompt above the statusline.
    --     row = -3,
    --   },
    -- },
    search = {
      exclude = {
        "flash_prompt",
        "qf",
        function(win)
          -- Floating windows from bqf.
          if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match "BqfPreview" then
            return true
          end

          -- Non-focusable windows.
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
    },
    modes = {
      char = {
        jump_labels = true,
      },
    },
  }
end

return M
