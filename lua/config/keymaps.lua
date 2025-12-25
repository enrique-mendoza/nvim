-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move a chunk of text and it will automatically indent
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Indent while remaining in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Search within visual selection - this is magic
map("x", "/", "<Esc>/\\%V")

-- Improving ^ and $ keymaps
map({ "n", "o", "x" }, "<s-h>", "^", opts)
map({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Tmux Navigation
local nvim_tmux_nav = require("nvim-tmux-navigation")

map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- Oil
map("n", "_", "<cmd>Oil<cr>", { desc = "Open Oil (parent dir)" })

-- Multicursors
map(
  { "n", "v" },
  "<c-n>",
  "<cmd>MCstart<cr>",
  { desc = "Create a selection for selected text or word under the cursor" }
)

-- Mini: splitjoin
map({ "n", "x" }, "sj", ":lua MiniSplitjoin.join()<cr>", opts)
map({ "n", "x" }, "sk", ":lua MiniSplitjoin.split()<cr>", opts)
