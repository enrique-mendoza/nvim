local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-nvim-dap.nvim",
  },
}

M.execs = {
  "astro",
  "bashls",
  "clangd",
  "cssls",
  "html",
  "jdtls",
  "jsonls",
  "lua_ls",
  "pyright",
  "vtsls",
}

M.dap_execs = {
  "java-debug-adapter",
  "java-test",
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = M.execs,
  }

  require("mason-nvim-dap").setup {
    ensure_installed = M.dap_execs,
  }

  require("which-key").add {
    {
      "<leader>lM",
      "<cmd>Mason<cr>",
      desc = "Mason Info",
    },
  }
end

return M
