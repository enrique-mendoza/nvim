local M = {
  "rockyzhang24/arctic.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  name = "arctic",
  branch = "main",
  priority = 1000,
}

return M
