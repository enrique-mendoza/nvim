local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPre",
}

function M.config()
  local options = {
    signs = true, -- Show icons in the signs column
    sign_priority = 8, -- Sign priority
    -- Keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- Icon used for the sign, and in search results
        color = "error", -- Can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- A set of other keywords that all map to this FIX keywords
        -- signs = false, -- Configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- When true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = true, -- Enable multine todo comments
      multiline_pattern = "^.", -- Lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- Extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- Pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- Uses treesitter to match keywords in comments only
      max_line_len = 400, -- Ignore lines longer than this
      exclude = {}, -- List of file types to exclude highlighting
    },
    -- List of named colors where we try to extract the guifg from the
    -- List of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "DiagnosticVirtualTextError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticVirtualTextWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticVirtualTextInfo", "#2563EB" },
      hint = { "DiagnosticVirtualTextHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- Regex that will be used to match keywords.
      -- Don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- Match without the extra colon. You'll likely get false positives
    },
  }

  require("todo-comments").setup(options)
end

return M
