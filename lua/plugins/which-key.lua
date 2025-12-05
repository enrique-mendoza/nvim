local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local icons = require "utils.icons"
  local wk = require "which-key"

  -- Setup
  wk.setup {
    preset = "helix",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- Extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  -- Keys
  -- Icon colors: azure, blue, cyan, green, grey, orange, purple, red, yellow
  wk.add {
    -- Hidden Commands
    {
      "<leader>h",
      "<cmd>split<CR>",
      desc = "HSplit",
      hidden = true,
    },
    {
      "<leader>v",
      "<cmd>vsplit<CR>",
      desc = "VSplit",
      hidden = true,
    },
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_current)",
      desc = "Comment",
      hidden = true,
    },
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_visual)",
      mode = "v",
      desc = "Comment",
      hidden = true,
    },
    -- Buffers & Tabs
    {
      "<leader>e",
      group = "Buffers/Tabs",
    },
    -- Debug
    {
      "<leader>d",
      group = "Debug",
    },
    -- Find
    {
      "<leader>f",
      group = "Find",
    },
    -- Git
    {
      "<leader>g",
      group = "Git",
    },
    -- LSP
    {
      "<leader>l",
      group = "LSP",
      icon = {
        icon = icons.ui.Code,
        color = "blue",
      },
    },
    -- Plugins
    {
      "<leader>p",
      group = "Plugins",
      icon = {
        icon = " ",
        color = "purple",
      },
    },
    -- Search/Replace
    {
      "<leader>r",
      group = "Search/Replace",
    },
    -- Search
    {
      "<leader>s",
      group = "Search",
    },
    -- Sessions
    {
      "<leader>S",
      group = "Sessions",
    },
    -- Tests
    {
      "<leader>t",
      group = "Test",
    },
    -- UI
    {
      "<leader>u",
      group = "UI",
    },
  }
end

return M
