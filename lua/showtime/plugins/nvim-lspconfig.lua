local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

local function lsp_keymaps(bufnr)
  local function keymap(lhs, rhs, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  keymap("gD", function()
    vim.lsp.buf.declaration()
  end, "Go to Declaration")

  keymap("gd", function()
    vim.lsp.buf.definition()
  end, "Go to Definition")

  keymap("<CR>", function()
    vim.lsp.buf.signature_help()
  end, "Signature Help")

  keymap("K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, "n")

  keymap("gI", function()
    vim.lsp.buf.implementation()
  end, "Go to Implementation")

  keymap("gr", function()
    vim.lsp.buf.references()
  end, "Go to References")

  keymap("gl", function()
    vim.diagnostic.open_float()
  end, "Open Float Diagnostics")

  keymap("[d", function()
    vim.diagnostic.jump { count = -1 }
  end, "Previous diagnostic")

  keymap("]d", function()
    vim.diagnostic.jump { count = 1 }
  end, "Next diagnostic")

  keymap("[e", function()
    vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
  end, "Previous error")

  keymap("]e", function()
    vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
  end, "Next error")
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true)
  end
end

M.toggle_inlay_hints = function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

function M.config()
  local icons = require "showtime.config.icons"
  local lspconfig = require "lspconfig"
  local servers = {
    "astro",
    "bashls",
    "clangd",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "ts_ls",
    "kulala_ls",
  }
  local wk = require "which-key"

  vim.diagnostic.config {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  }

  local hover = vim.lsp.buf.hover
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.buf.hover = function()
    return hover {
      border = "rounded",
      max_height = math.floor(vim.o.lines * 0.5),
      max_width = math.floor(vim.o.columns * 0.4),
    }
  end

  local signature_help = vim.lsp.buf.signature_help
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.buf.signature_help = function()
    return signature_help {
      border = "rounded",
      max_height = math.floor(vim.o.lines * 0.5),
      max_width = math.floor(vim.o.columns * 0.4),
    }
  end

  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "showtime.plugins.lspsettings." .. server)

    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)

    if server == "nginx-language-server" then
      require("lspconfig").nginx_language_server.setup(opts)
    end
  end

  wk.add {
    {
      "<leader>la",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
    },
    {
      "<leader>la",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
      mode = { "v" },
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
