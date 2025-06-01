local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local icons = require "showtime.config.icons"
  local persistence = require "persistence"
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
    {
      "<leader>w",
      "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = "Wrap",
      hidden = true,
    },
    -- Buffers & Tabs
    {
      "<leader>b",
      group = "Buffers/Tabs",
    },
    {
      "<leader>bh",
      "<cmd>-tabmove<cr>",
      desc = "Move Left",
    },
    {
      "<leader>bl",
      "<cmd>+tabmove<cr>",
      desc = "Move Right",
    },
    {
      "<leader>bn",
      "<cmd>:tabn<CR>",
      desc = "Next Tab",
    },
    {
      "<leader>bo",
      "<cmd>tabonly<cr>",
      desc = "Only",
    },
    {
      "<leader>bp",
      "<cmd>:tabp<CR>",
      desc = "Previous Tab",
    },
    {
      "<leader>bt",
      "<cmd>tabnew %<cr>",
      desc = "New Tab",
    },
    {
      "<leader>bT",
      "<cmd>$tabnew<cr>",
      desc = "New Empty Tab",
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
    {
      "<leader>Sd",
      "<cmd>Autosession delete<CR>",
      desc = "Delete Session",
    },
    {
      "<leader>Sf",
      function()
        persistence.select()
      end,
      desc = "Select Session",
    },
    {
      "<leader>Sl",
      function()
        persistence.load { last = true }
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>Sr",
      function()
        persistence.load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>Ss",
      function()
        persistence.stop()
      end,
      desc = "Don't Save Current Session",
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
    {
      "<leader>uk",
      -- "<cmd>Screenkey toggle<cr>"
      "<cmd>ShowkeysToggle<cr>",
      desc = "Screenkey toggle",
    },
    {
      "<leader>up",
      "<cmd>Precognition toggle<cr>",
      desc = "Precognition toggle",
    },
    {
      "<leader>ur",
      "<cmd>RenderMarkdown toggle<cr>",
      desc = "Render markdown toggle",
    },
  }
end

return M
