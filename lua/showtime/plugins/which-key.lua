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
    {
      "<leader>go",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      desc = "Blame",
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
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action",
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action",
      mode = { "v" },
    },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    {
      "<leader>lg",
      group = "GrugFar",
    },
    {
      "<leader>lgc",
      function()
        local grug = require "grug-far"
        grug.open { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "In Current File",
      mode = { "n", "x" },
    },
    {
      "<leader>lgg",
      function()
        local grug = require "grug-far"
        grug.open { transient = true }
      end,
      desc = "Globally",
      mode = { "n", "x" },
    },
    {
      "<leader>lgv",
      function()
        local grug = require "grug-far"
        grug.with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "With The Current Visual Selection",
      mode = { "n", "x" },
    },
    {
      "<leader>lI",
      "<cmd>LspInfo<cr>",
      desc = "LSP Info",
    },
    {
      "<leader>ll",
      "<cmd>lua vim.lsp.codelens.run()<cr>",
      desc = "CodeLens Action",
    },
    {
      "<leader>lM",
      "<cmd>Mason<cr>",
      desc = "Mason Info",
    },
    {
      "<leader>ln",
      "<cmd>Navbuddy<cr>",
      desc = "Nav",
      icon = {
        icon = icons.misc.CircuitBoard,
        color = "blue",
      },
    },
    {
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<cr>",
      desc = "Quickfix",
    },
    {
      "<leader>lr",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      desc = "Rename",
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
    {
      "<leader>pc",
      "<cmd>Lazy clean<cr>",
      desc = "Clean",
    },
    {
      "<leader>pd",
      "<cmd>Lazy debug<cr>",
      desc = "Debug",
    },
    {
      "<leader>pi",
      "<cmd>Lazy install<cr>",
      desc = "Install",
    },
    {
      "<leader>pl",
      "<cmd>Lazy log<cr>",
      desc = "Log",
    },
    {
      "<leader>pp",
      "<cmd>Lazy profile<cr>",
      desc = "Profile",
    },
    {
      "<leader>ps",
      "<cmd>Lazy sync<cr>",
      desc = "Sync",
    },
    {
      "<leader>pS",
      "<cmd>Lazy clear<cr>",
      desc = "Status",
    },
    {
      "<leader>pu",
      "<cmd>Lazy update<cr>",
      desc = "Update",
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
    {
      "<leader>ta",
      "<cmd>lua require('neotest').run.attach()<cr>",
      desc = "Attach Test",
    },
    {
      "<leader>td",
      "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
      desc = "Debug Test",
    },
    {
      "<leader>tf",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Test File",
    },
    {
      "<leader>ts",
      "<cmd>lua require('neotest').run.stop()<cr>",
      desc = "Test Stop",
    },
    {
      "<leader>tt",
      "<cmd>lua require'neotest'.run.run()<cr>",
      desc = "Test Nearest",
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
