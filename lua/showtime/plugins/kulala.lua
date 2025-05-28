local M = {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = false,
  },
}

function M.config()
  require("kulala").setup {
    global_keymaps = false,
    -- dev, test, prod, can be anything
    -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
    default_env = "local",
    ui = {
      -- display mode: possible values: "split", "float"
      display_mode = "float",
      formatter = true,
    },
  }
end

return M
