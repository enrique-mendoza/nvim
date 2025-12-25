local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  require("which-key").add {
    {
      "<leader>la",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
      mode = { "n", "v" },
    },
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format {
          async = true,
          filter = function(client)
            return client.name ~= "typescript-tools"
          end,
        }
      end,
      desc = "Format",
    },
    {
      "<leader>lI",
      "<cmd>LspInfo<cr>",
      desc = "LSP Info",
    },
    {
      "<leader>ll",
      function()
        vim.lsp.codelens.run()
      end,
      desc = "CodeLens Action",
    },
    {
      "<leader>lq",
      function()
        vim.diagnostic.setloclist()
      end,
      desc = "Quickfix",
    },
    {
      "<leader>lr",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
    },
  }
end

return M
