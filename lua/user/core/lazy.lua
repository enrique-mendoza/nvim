local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = LAZY_PLUGIN_SPEC,
  install = {
    colorscheme = { "default" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require("which-key").add {
  {
    "<leader>pc",
    "<cmd>Lazy clean<cr>",
    desc = "Clean",
  },
  {
    "<leader>pd",
    "<cmd>Lazy debug<cr>",
    desc = "Debug",
  },
  {
    "<leader>pi",
    "<cmd>Lazy install<cr>",
    desc = "Install",
  },
  {
    "<leader>pl",
    "<cmd>Lazy log<cr>",
    desc = "Log",
  },
  {
    "<leader>pp",
    "<cmd>Lazy profile<cr>",
    desc = "Profile",
  },
  {
    "<leader>ps",
    "<cmd>Lazy sync<cr>",
    desc = "Sync",
  },
  {
    "<leader>pS",
    "<cmd>Lazy clear<cr>",
    desc = "Status",
  },
  {
    "<leader>pu",
    "<cmd>Lazy update<cr>",
    desc = "Update",
  },
}
