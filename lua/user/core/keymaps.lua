local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local discipline = require("user.plugins.discipline")

keymap("n", "<Space>", "", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- escape and clear hlsearch
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)

keymap("x", "p", [["_dP]], opts)

keymap({ "n", "v" }, "<leader>y", '"+y"')

keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
keymap("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

-- keymap("n", "<s-tab>", "<cmd>tabnew %<cr>", opts)
-- keymap({ "n" }, "<s-h>", "<cmd>tabp<cr>", opts)
-- keymap({ "n" }, "<s-l>", "<cmd>tabn<cr>", opts)

keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- put your cursor to same position while yanking
keymap("n", "p", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd "put"
  vim.api.nvim_win_set_cursor(0, { row + 1, col })
end)

-- search within visual selection - this is magic
keymap("x", "/", "<Esc>/\\%V")

-- duplicate line and comment the first line
keymap("n", "ycc", "yygccp", { remap = true })

-- make j and k movements with multiple save to jumplist
-- for example jump 12 lines down with "12j" and go back to where you ran that motion with C-o
keymap("n", "j", function()
  if vim.v.count > 0 then
    return "m'" .. vim.v.count .. "j"
  end
  return "j"
end, { expr = true })

keymap("n", "k", function()
  if vim.v.count > 0 then
    return "m'" .. vim.v.count .. "k"
  end
  return "k"
end, { expr = true })

-- discipline.cowboy()
