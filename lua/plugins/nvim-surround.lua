local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup {
    -- keymaps = { -- vim-surround style keymaps
    --   insert = "<C-g>s",
    --   insert_line = "<C-g>S",
    --   normal = "s",
    --   normal_cur = "ss",
    --   normal_line = "S",
    --   normal_cur_line = "SS",
    --   visual = "s",
    --   visual_line = "gS",
    --   delete = "ds",
    --   change = "cs",
    -- },
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "ys",
      normal_cur = "yss",
      normal_line = "yS",
      normal_cur_line = "ySS",
      visual = "S",
      visual_line = "gS",
      delete = "ds",
      change = "cs",
      change_line = "cS",
    },
  }
end

return M
