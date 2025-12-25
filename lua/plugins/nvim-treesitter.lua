local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- New rewritten branch
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

function M.config()
  local treesitter = require "nvim-treesitter"

  treesitter.setup {
    -- enable syntax highlighting
    highlight = {
      enable = true,
      -- disable highlighting for large files
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    -- enable indentation
    indent = { enable = false },
    -- ensure these language parsers are installed
    ensure_installed = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "python",
      "go",
      "rust",
      "c",
      "cpp",
    },
  }

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end

return M
