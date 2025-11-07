-- Navigation with jump motions.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    jump = { nohlsearch = true },
    prompt = {
      win_config = {
        border = "none",
        -- row = -3, -- Place the prompt above the statusline.
      },
    },
    search = {
      exclude = {
        "flash_prompt",
        "qf",
        function(win)
          -- Floating windows from bqf.
          if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match "BqfPreview" then
            return true
          end

          -- Non-focusable windows.
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
      wrap = true,
    },
    modes = {
      char = {
        jump_labels = true,
      },
      search = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "zk",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "Zk",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
