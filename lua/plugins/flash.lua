-- Navigation with jump motions.
local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

function M.config()
  local flash = require "flash"
  local icons = require "utils.icons"

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
      wrap = true,
    },
    modes = {
      char = {
        jump_labels = true,
      },
      search = {
        enabled = true,
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
        flash.treesitter()
      end,
      desc = "Flash Treesitter",
      icon = {
        icon = icons.misc.Lightning,
        color = "orange",
      },
      mode = { "n", "x", "o" },
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
    {
      "<leader>sR",
      function()
        flash.treesitter_search()
      end,
      desc = "Treesitter Search",
      icon = {
        icon = icons.misc.Lightning,
        color = "orange",
      },
      mode = { "o", "x" },
    },
  }
end

return M
