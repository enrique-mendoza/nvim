return {
  {
    -- Plugin: multicursors.nvim
    -- URL: https://github.com/smoka7/multicursors.nvim
    -- Description: With this plugin, you can easily create and manage multiple selections, perform
    -- simultaneous edits, and execute commands on all selections at once.
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    config = function()
      require("multicursors").setup({
        hint_config = {
          float_opts = {
            border = "rounded",
          },
          position = "bottom-right",
        },
        -- Accepted values:
        -- -1 true: generate hints
        -- -2 false: don't generate hints
        -- -3 [[multi line string]] provide your own hints
        -- -4 fun(heads: Head[]): string - provide your own hints
        generate_hints = {
          normal = true,
          insert = true,
          extend = true,
          config = {
            -- Determines how many columns are used to display the hints.
            -- If you leave this option nil, the number of columns will depend on the size of your window.
            column_count = 1,
            -- Maximum width of a column.
            max_hint_length = 25,
          },
        },
      })

      local api = vim.api
      local mocha = require("catppuccin.palettes").get_palette("mocha")

      api.nvim_set_hl(
        0,
        "MultiCursor",
        { fg = mocha.peach, bg = api.nvim_get_hl(0, { name = "Visual", link = false }).bg, bold = true }
      )
      api.nvim_set_hl(0, "MultiCursorMain", { fg = mocha.green, bg = "none", bold = true })
    end,
  },
  {
    -- Plugin: mini.splitjoin
    -- URL: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-splitjoin.md
    -- Description: Mappings and Lua functions that modify arguments (regions inside brackets between allowed separators) under cursor.
    "nvim-mini/mini.splitjoin",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.splitjoin").setup({
        mappings = { toggle = "" }, -- Disable default mapping
      })
    end,
  },
}
