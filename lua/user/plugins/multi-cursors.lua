local M = {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/hydra.nvim",
  },
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
end

return M
