local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}

function M.config()
  local icons = require "utils.icons"
  local gitsigns = require "gitsigns"

  gitsigns.setup {
    signs = {
      add = {
        -- hl = "GitSignsAdd",
        text = icons.ui.BoldLineMiddle,
        -- numhl = "GitSignsAddNr",
        -- linehl = "GitSignsAddLn",
      },
      change = {
        -- hl = "GitSignsChange",
        text = icons.ui.BoldLineDashedMiddle,
        -- numhl = "GitSignsChangeNr",
        -- linehl = "GitSignsChangeLn",
      },
      delete = {
        -- hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        -- numhl = "GitSignsDeleteNr",
        -- linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        -- hl = "GitSignsDelete",
        text = icons.ui.TriangleShortArrowRight,
        -- numhl = "GitSignsTopDeleteNr",
        -- linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        -- hl = "GitSignsChange",
        text = icons.ui.BoldLineMiddle,
        -- numhl = "GitSignsChangeNr",
        -- linehl = "GitSignsChangeLn",
      },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }

  -- Text object
  vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk)

  require("which-key").add {
    {
      "<leader>ga",
      function()
        gitsigns.stage_hunk()
      end,
      desc = "Stage Hunk",
    },
    {
      "<leader>ga",
      function()
        gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      desc = "Stage Hunk",
      mode = "v",
    },
    {
      "<leader>gB",
      function()
        gitsigns.blame()
      end,
      desc = "Git Blame",
    },
    {
      "<leader>gj",
      function()
        gitsigns.nav_hunk("next", { navigation_message = false })
      end,
      desc = "Next Hunk",
    },
    {
      "<leader>gk",
      function()
        gitsigns.nav_hunk("prev", { navigation_message = false })
      end,
      desc = "Previous Hunk",
    },
    {
      "<leader>gr",
      function()
        gitsigns.reset_hunk()
      end,
      desc = "Reset Hunk",
    },
    {
      "<leader>gr",
      function()
        gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      desc = "Reset Hunk",
      mode = "v",
    },
    {
      "<leader>gR",
      function()
        gitsigns.reset_buffer()
      end,
      desc = "Reset Buffer",
    },
    {
      "<leader>gp",
      function()
        gitsigns.preview_hunk()
      end,
      desc = "Preview Hunk",
    },
    {
      "<leader>gP",
      function()
        gitsigns.preview_hunk_inline()
      end,
      desc = "Preview Hunk Inline",
    },
    {
      "<leader>gq",
      function()
        gitsigns.setqflist "all"
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>gQ",
      function()
        gitsigns.setqflist()
      end,
      desc = "Quickfix List In Current File",
    },
    {
      "<leader>gu",
      function()
        gitsigns.undo_stage_hunk()
      end,
      desc = "Undo Stage Hunk",
    },
  }
end

return M
