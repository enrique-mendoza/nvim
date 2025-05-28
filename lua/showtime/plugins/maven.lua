local M = {
  "eatgrass/maven.nvim",
  cmd = { "Maven", "MavenExec" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("maven").setup {
      executable = "./mvnw",
    }
  end,
}

function M.config()
  require("maven").setup {}
end

return M
