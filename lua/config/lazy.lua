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

require("lazy").setup("plugins", {
  ui = { border = "rounded" },
  dev = { path = vim.g.projects_dir },
  install = {
    colorscheme = { "auto" },
    missing = true,
  },
  change_detection = { notify = false },
  rocks = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

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
