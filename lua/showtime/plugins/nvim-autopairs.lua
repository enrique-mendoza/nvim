local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

M.config = function()
  local npairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"
  local conds = require "nvim-autopairs.conds"

  npairs.setup {
    map_char = {
      all = "(",
      tex = "{",
    },
    enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    disable_in_macro = false,
    enable_afterquote = true,
    map_bs = true,
    map_c_w = false,
    disable_in_visualblock = false,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  }

  -- Autoclosing angle-brackets.
  npairs.add_rule(Rule("<", ">", {
    -- Avoid conflicts with nvim-ts-autotag.
    "-html",
    "-javascriptreact",
    "-typescriptreact",
  }):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
    return opts.char == ">"
  end))
end

return M
