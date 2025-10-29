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
      insert = false,
      insert_line = false,
      visual_line = false,
      normal = "yz",
      normal_cur = "yzz",
      normal_line = "yZ",
      normal_cur_line = "yZZ",
      visual = "Z",
    },
  }
end

return M
