local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  local snacks = require "snacks"

  snacks.setup {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
    zen = {
      enabled = true,
      toggles = {
        ufo = true,
        dim = true,
        git_signs = false,
        diagnostics = false,
        line_number = false,
        relative_number = false,
        signcolumn = "no",
        indent = false,
      },
    },
  }

  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        snacks.debug.inspect(...)
      end
      _G.bt = function()
        snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command

      -- Create some toggle mappings
      snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
      snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
      snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
      snacks.toggle.diagnostics():map "<leader>ud"
      snacks.toggle.line_number():map "<leader>ul"
      snacks.toggle
        .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
        :map "<leader>uC"
      snacks.toggle.treesitter():map "<leader>uT"
      snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>ub"
      snacks.toggle.inlay_hints():map "<leader>ui"
      snacks.toggle.indent():map "<leader>ug"
      snacks.toggle.dim():map "<leader>uD"
      snacks.toggle.new {
        id = "ufo",
        name = "Enable/Disable ufo",
        get = function()
          return require("ufo").inspect()
        end,
        set = function(state)
          if state == nil then
            require("noice").enable()
            require("ufo").enable()
            vim.o.foldenable = true
            vim.o.foldcolumn = "1"
          else
            require("noice").disable()
            require("ufo").disable()
            vim.o.foldenable = false
            vim.o.foldcolumn = "0"
          end
        end,
      }
    end,
  })
end

return M
