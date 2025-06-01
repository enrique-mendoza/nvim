local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
  },
}

function M.config()
  local neotest = require "neotest"

  ---@diagnostic disable: missing-fields
  neotest.setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-rust",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },

    require("which-key").add {
      {
        "<leader>ta",
        function()
          neotest.run.attach()
        end,
        desc = "Attach Test",
      },
      {
        "<leader>td",
        function()
          neotest.run.run { strategy = "dap" }
        end,
        desc = "Debug Test",
      },
      {
        "<leader>tf",
        function()
          neotest.run.run(vim.fn.expand "%")
        end,
        desc = "Test File",
      },
      {
        "<leader>ts",
        function()
          neotest.run.stop()
        end,
        desc = "Test Stop",
      },
      {
        "<leader>tt",
        function()
          neotest.run.run()
        end,
        desc = "Test Nearest",
      },
    },
  }
end

return M
