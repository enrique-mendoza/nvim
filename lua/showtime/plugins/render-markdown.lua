local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {},
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}

function M.config()
  require("render-markdown").setup {
    file_types = { "markdown", "vimwiki" },
    enabled = false,
    latex = { enabled = false },
  }

  require("which-key").add {
    {
      "<leader>ur",
      "<cmd>RenderMarkdown toggle<cr>",
      desc = "Toggle Render Markdown",
    },
  }
end

return M
