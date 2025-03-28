local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  -- local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.shfmt,
      formatting.google_java_format.with {
        -- AOSP (Android Open Source Project) style,
        -- which uses 4 spaces per indentation level instead of the default 2 spaces.
        extra_args = { "--aosp" },
      },
      formatting.clang_format.with {
        disabled_filetypes = { "java" },
      },

      -- diagnostics.shellcheck,

      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
