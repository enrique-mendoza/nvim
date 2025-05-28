local M = {
  "elmcgill/springboot-nvim",
  ft = "java", -- Enable only on .java file extensions
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
  },
}

function M.config()
  require("springboot-nvim").setup {}
end

return M
