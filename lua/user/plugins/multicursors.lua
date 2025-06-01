local M = {
  -- other option: terryma/vim-multiple-cursors
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/hydra.nvim",
  },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
}

function M.config()
  require("multicursors").setup {
    hint_config = {
      float_opts = {
        border = "rounded",
      },
      position = "bottom-right",
    },
    generate_hints = {
      normal = true,
      insert = true,
      extend = true,
      config = {
        column_count = 1,
      },
    },
  }

  vim.api.nvim_set_hl(
    0,
    "MultiCursor",
    { fg = "none", bg = vim.api.nvim_get_hl(0, { name = "Visual", link = false }).bg, bold = true }
  )
  vim.api.nvim_set_hl(0, "MultiCursorMain", { fg = "#ffffff", bg = "none", bold = true })
  vim.api.nvim_set_hl(0, "MultiCursorVisual", { fg = "#000000", bg = "none", underline = true })

  require("which-key").add {
    {
      "<c-n>",
      "<cmd>MCstart<CR>",
      hidden = true,
    },
  }
end

return M
