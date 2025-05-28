local M = {
  "folke/lazydev.nvim",
}

function M.config()
  require("lazydev").setup {
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        "lazy.nvim",
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        -- always load the LazyVim library
        "LazyVim",
        -- Only load the lazyvim library when the `LazyVim` global is found
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "nvim-dap-ui" },
      },
    },
  }
end

return M
