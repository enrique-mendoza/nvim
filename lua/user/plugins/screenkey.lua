local M = {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- Or branch = "dev", to use the latest commit
}

function M.config()
  require("screenkey").setup {
    win_opts = {
      row = 0, -- vim.o.lines - vim.o.cmdheight - 1,
      col = vim.o.columns - 1,
      relative = "editor",
      anchor = "SE",
      width = 40,
      height = 3,
      border = "rounded",
      title = "Screenkey",
      title_pos = "center",
      style = "minimal",
      focusable = false,
      noautocmd = true,
    },
    compress_after = 3,
    clear_after = 3,
    disable = {
      filetypes = {},
      buftypes = {},
      events = false,
    },
    show_leader = true,
    group_mappings = false,
    display_infront = {},
    display_behind = {},
    filter = function(keys)
      return keys
    end,
    keys = {
      ["<TAB>"] = "󰌒",
      ["<CR>"] = "󰌑",
      ["<ESC>"] = "Esc",
      ["<SPACE>"] = "␣",
      ["<BS>"] = "󰌥",
      ["<DEL>"] = "Del",
      ["<LEFT>"] = "",
      ["<RIGHT>"] = "",
      ["<UP>"] = "",
      ["<DOWN>"] = "",
      ["<HOME>"] = "Home",
      ["<END>"] = "End",
      ["<PAGEUP>"] = "PgUp",
      ["<PAGEDOWN>"] = "PgDn",
      ["<INSERT>"] = "Ins",
      ["<F1>"] = "󱊫",
      ["<F2>"] = "󱊬",
      ["<F3>"] = "󱊭",
      ["<F4>"] = "󱊮",
      ["<F5>"] = "󱊯",
      ["<F6>"] = "󱊰",
      ["<F7>"] = "󱊱",
      ["<F8>"] = "󱊲",
      ["<F9>"] = "󱊳",
      ["<F10>"] = "󱊴",
      ["<F11>"] = "󱊵",
      ["<F12>"] = "󱊶",
      ["CTRL"] = "Ctrl",
      ["ALT"] = "Alt",
      ["SUPER"] = "󰘳",
      ["<leader>"] = "<leader>",
    },
  }

  -- Run screenkey off rip
  vim.cmd "Screenkey"
end

return M
