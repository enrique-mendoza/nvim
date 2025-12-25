local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
-- keymap("n", "<C-i>", "<C-i>", opts)

keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Remap for dealing with word wrap and adding jumps to the jumplist.
keymap("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
keymap("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- Make U opposite to u.
keymap("n", "U", "<C-r>", opts)

-- Switch between windows.
-- I can also use Ctrl key using vim-tmux-navigator plugin.
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Resize windows
keymap("n", "<m-Up>", ":resize -2<CR>", opts)
keymap("n", "<m-Down>", ":resize +2<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +2<CR>", opts)

-- Keeping the cursor centered.
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*zzzv", opts)
keymap("n", "#", "#zzzv", opts)
keymap("n", "g*", "g*zzzv", opts)
keymap("n", "g#", "g#zzzv", opts)

-- Move a chunk of text and it will automatically indent.
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Indent while remaining in visual mode.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Search within visual selection - this is magic
keymap("x", "/", "<Esc>/\\%V")

-- Improving ^ and $ keymaps.
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Exit Terminal input and bring you back to Normal mode in that terminal buffer.
keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- Escape and save changes.
keymap({ "s", "i", "n", "v" }, "<C-s>", "<esc>:w<cr>", opts)
keymap({ "s", "i", "n", "v" }, "<C-S-s>", "<esc>:wa<cr>", opts)

-- Quickly go to the end of the line while in insert mode.
keymap({ "i", "c" }, "<C-l>", "<C-o>A", opts)

-- Duplicate line and comment the first line.
keymap("n", "ycc", "yygccp", { remap = true })

-- 'g.' after the ciw and then I can press dot dot to replace all words.
keymap("n", "g.", '/\\V\\C<C-r>"<CR>cgn<C-a><Esc>')

-- Put your cursor to same position while yanking
-- keymap("n", "p", function()
--   local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--   vim.cmd "put"
--   vim.api.nvim_win_set_cursor(0, { row + 1, col })
-- end)

-- Improving pasting, copying and deleting keymaps.
-- keymap("x", "<leader>p", [["_dP]])

-- keymap({ "n", "v" }, "<leader>y", [["+y]])
-- keymap("n", "<leader>Y", [["+Y]])

-- keymap({ "n", "v" }, "<leader>d", '"_d')

-- I don't know why I have this.
keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
