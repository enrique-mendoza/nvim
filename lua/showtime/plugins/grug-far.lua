local M = {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
}

function M.config()
  require("grug-far").setup {}
end

return M
