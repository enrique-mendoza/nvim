local M = {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
}

function M.config()
  require("nvim-ts-autotag").setup {
    opts = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
    },
  }
end

return M
