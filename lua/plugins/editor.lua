return {
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A vim-vinegar like file explorer that
    -- lets you edit your filesystem like a normal Neovim buffer.
    "stevearc/oil.nvim",
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
    },
    lazy = false,
    config = function()
      local oil = require("oil")

      oil.setup({
        columns = {
          "icon",
          { "permissions", highlight = "Type" },
          { "size", highlight = "String" },
          { "mtime", highlight = "Keyword" },
        },
        keymaps = {
          ["h"] = { "actions.parent", mode = "n" },
          ["q"] = { "actions.close", mode = "n" },
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          max_width = 200,
        },
        preview_win = {
          update_on_cursor_moved = true,
        },
        lsp_file_methods = {
          enabled = true,
          timeout_ms = 1000,
          autosave_changes = true,
        },
      })

      vim.keymap.set("n", "-", function()
        oil.open_float(nil, { preview = {} })
      end, { desc = "Open parent directory" })
    end,
  },
}
