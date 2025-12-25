local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local icons = require "utils.icons"

  -- Custom Lualine component to show attached language server
  local clients_lsp = function()
    local clients = vim.lsp.get_clients()

    if next(clients) == nil then
      return ""
    end

    local c = {}

    for _, client in pairs(clients) do
      table.insert(c, client.name)
    end

    -- "|"
    return icons.statusline.Lsp .. table.concat(c, " ~ ")
  end

  local cwd = function()
    local name = vim.uv.cwd()

    return name:match "([^/\\]+)[/\\]*$" or name
  end

  require("lualine").setup {
    options = {
      component_separators = "",
      section_separators = {
        left = icons.statusline.RoundDividerRight,
        right = icons.statusline.RoundDividerLeft,
      },
      disabled_filetypes = { "alpha", "Outline" },
      ignore_focus = { "NvimTree" },
      theme = "auto",
    },
    sections = {
      lualine_a = {
        {
          "mode",
          icon = icons.statusline.Mode,
          separator = {
            left = "",
            right = "",
          },
        },
      },
      lualine_b = {
        {
          "filetype",
          icon_only = true,
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          "filename",
          padding = {
            left = 0,
            right = 1,
          },
          separator = {
            left = "",
            right = "",
          },
        },
      },
      lualine_c = {
        {
          "branch",
          icon = icons.statusline.git.Branch,
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          "diff",
          symbols = {
            added = icons.statusline.git.LineAdded,
            modified = icons.statusline.git.LineModified,
            removed = icons.statusline.git.LineRemoved,
          },
          colored = true,
        },
      },
      lualine_x = {
        {
          "diagnostics",
          symbols = {
            error = icons.statusline.diagnostics.Error,
            warn = icons.statusline.diagnostics.Warning,
            info = icons.statusline.diagnostics.Information,
            hint = icons.statusline.diagnostics.Hint,
          },
          colored = true,
          update_in_insert = true,
        },
        clients_lsp,
      },
      lualine_y = {
        {
          cwd,
          icon = icons.statusline.Cwd,
        },
      },
      lualine_z = {
        {
          "location",
          separator = {
            left = icons.statusline.RoundDividerLeft,
            right = "",
          },
          padding = {
            left = 0,
            right = 1,
          },
          icon = icons.statusline.Location,
        },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    -- extensions = { "quickfix", "man", "fugitive", "oil" },
    extensions = { "quickfix", "man", "fugitive", "toggleterm", "trouble" },
  }
end

return M
