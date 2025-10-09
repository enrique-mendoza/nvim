local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "bash",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
    },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    autopairs = { enable = true },
    textobjects = {
      select = {
        enable = true,
        -- automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- you can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@parameter.inner"] = "v", -- charwise
          ["@function.outer"] = "v", -- charwise
          ["@conditional.outer"] = "V", -- linewise
          ["@loop.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_previous_start = {
          ["[f"] = { query = "@function.outer", desc = "Previous function" },
          ["[c"] = { query = "@class.outer", desc = "Previous class" },
          ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
        },
        goto_next_start = {
          ["]f"] = { query = "@function.outer", desc = "Next function" },
          ["]c"] = { query = "@class.outer", desc = "Next class" },
          ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
        },
      },
      -- swap = {
      --   enable = true,
      --   swap_next = {
      --     ["<leader>a"] = "@parameter.inner",
      --   },
      --   swap_previous = {
      --     ["<leader>A"] = "@parameter.inner",
      --   },
      -- },
    },
  }
end

return M
