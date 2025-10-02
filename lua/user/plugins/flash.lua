local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

function M.config()
  local flash = require "flash"
  local icons = require "user.config.icons"

  flash.setup {
    jump = { nohlsearch = true },
    prompt = {
      win_config = {
        border = "none",
        -- row = -3, -- Place the prompt above the statusline.
      },
    },
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

  require("which-key").add {
    {
      "<leader>sf",
      function()
        flash.jump()
      end,
      desc = "Flash",
      icon = {
        icon = icons.misc.Lightning,
        color = "orange",
      },
      mode = { "n", "x", "o" },
    },
    {
      "<leader>sF",
      function()
        flash.treesitter_search()
      end,
      desc = "Treesitter Search",
      icon = {
        icon = icons.misc.Lightning,
        color = "orange",
      },
      mode = { "n", "x" },
    },
    {
      "<leader>sr",
      function()
        flash.remote()
      end,
      desc = "Remote Flash",
      icon = {
        icon = icons.misc.Lightning,
        color = "orange",
      },
      mode = "o",
    },
  }
end

return M
