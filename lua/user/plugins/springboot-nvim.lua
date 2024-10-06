local M = {
  "elmcgill/springboot-nvim",
  depedencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
  },
}

function M.config()
  require("springboot-nvim").setup {}
end

return M
