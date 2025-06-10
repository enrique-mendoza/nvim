local M = {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  event = "VeryLazy",
}

function M.config()
  local grug = require "grug-far"

  grug.setup {
    helpLine = {
      enabled = false,
    },
    showCompactInputs = true,
    showInputsTopPadding = false,
    showInputsBottomPadding = false,
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "grug-far",
    callback = function()
      -- Map <Esc> to quit after ensuring we're in normal mode
      vim.keymap.set("n", "<Esc>", "<Cmd>stopinsert | bd!<CR>", { buffer = true })
    end,
  })

  require("which-key").add {
    {
      "<leader>rc",
      function()
        grug.open { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "In Current File",
      mode = { "n", "x" },
    },
    {
      "<leader>rg",
      function()
        grug.open { transient = true }
      end,
      desc = "Globally",
      mode = { "n", "x" },
    },
    {
      "<leader>rv",
      function()
        grug.with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "With The Current Visual Selection",
      mode = { "n", "x" },
    },
  }
end

return M
