local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")

  -- setup
  wk.setup {
    preset = "helix",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  -- keys
  -- icon colors
  -- azure, blue, cyan, green, grey, orange, purple, red, yellow
  wk.add {
    -- comment
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_current)",
      desc = "Comment",
      hidden = true,
    },
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_visual)",
      mode = "v",
      desc = "Comment",
      hidden = true,
    },
    -- new terminal
    {
      "<leader>;",
      "<cmd>tabnew | terminal<CR>",
      desc = "Term",
      icon = {
        icon = " ",
        color = "green",
      },
    },
    -- AI 
    -- {
    --   "<leader>a",
    --   group = "AI",
    --   icon = {
    --     icon = " ",
    --     color = "blue",
    --   },
    -- },
    -- {
    --   "<leader>aa",
    --   "<cmd>GpChatToggle vsplit<cr>",
    --   desc = "Toggle Chat",
    -- },
    -- {
    --   "<leader>an",
    --   "<cmd>GpChatNew vsplit<cr>",
    --   desc = "New Chat",
    -- },
    -- {
    --   "<leader>af",
    --   "<cmd>GpChatFinder<cr>",
    --   desc = "New Chat",
    -- },
    -- {
    --   "<leader>ar",
    --   "<cmd>GpChatRespond<cr>",
    --   desc = "Respond",
    -- },
    -- {
    --   "<leader>aw",
    --   "<cmd>GpRewrite<cr>",
    --   desc = "Rewrite",
    --   mode = { "n", "v" },
    -- },
    -- {
    --   "<leader>ap",
    --   "<cmd>GpAppend<cr>",
    --   desc = "Append",
    --   mode = { "n", "v" },
    -- },
    -- tabs
    {
      "<leader>a",
      group = "Tab",
    },
    {
      "<leader>aa",
      "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
      desc = "Find Tabs",
    },
    {
      "<leader>ah",
      "<cmd>-tabmove<cr>",
      desc = "Move Left",
    },
    {
      "<leader>al",
      "<cmd>+tabmove<cr>",
      desc = "Move Right",
    },
    {
      "<leader>aN",
      "<cmd>tabnew %<cr>",
      desc = "New Tab",
    },
    {
      "<leader>an",
      "<cmd>$tabnew<cr>",
      desc = "New Empty Tab",
    },
    {
      "<leader>ao",
      "<cmd>tabonly<cr>",
      desc = "Only",
    },
    -- buffers
    {
      "<leader>b",
      group = "Buffers",
    },
    {
      "<leader>bb",
      "<cmd>Telescope buffers previewer=false<cr>",
      desc = "Find",
    },
    -- dap
    {
      "<leader>d",
      group = "Debug",
    },
    {
      "<leader>db",
      "<cmd>lua require'dap'.step_back()<cr>",
      desc = "Step Back",
    },
    {
      "<leader>dC",
      "<cmd>lua require'dap'.run_to_cursor()<cr>",
      desc = "Run To Cursor",
    },
    {
      "<leader>dc",
      "<cmd>lua require'dap'.continue()<cr>",
      desc = "Continue",
    },
    {
      "<leader>dd",
      "<cmd>lua require'dap'.disconnect()<cr>",
      desc = "Disconnect",
    },
    {
      "<leader>dg",
      "<cmd>lua require'dap'.session()<cr>",
      desc = "Get Session",
    },
    {
      "<leader>di",
      "<cmd>lua require'dap'.step_into()<cr>",
      desc = "Step Into",
    },
    {
      "<leader>do",
      "<cmd>lua require'dap'.step_over()<cr>",
      desc = "Step Over",
    },
    {
      "<leader>dp",
      "<cmd>lua require'dap'.pause()<cr>",
      desc = "Pause",
    },
    {
      "<leader>dq",
      "<cmd>lua require'dap'.close()<cr>",
      desc = "Quit",
    },
    {
      "<leader>dr",
      "<cmd>lua require'dap'.repl.toggle()<cr>",
      desc = "Toggle Repl",
    },
    {
      "<leader>ds",
      "<cmd>lua require'dap'.continue()<cr>",
      desc = "Start",
    },
    {
      "<leader>dt",
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dU",
      "<cmd>lua require'dapui'.toggle({reset = true})<cr>",
      desc = "Toggle UI",
    },
    {
      "<leader>du",
      "<cmd>lua require'dap'.step_out()<cr>",
      desc = "Step Out",
    },
    -- tree
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Explorer",
      icon = {
        icon = "",
        color = "green"
      }
    },
    -- find
    {
      "<leader>f",
      group = "Find",
    },
    {
      "<leader>fb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
    },
    {
      "<leader>fC",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
    },
    {
      "<leader>fc",
      "<cmd>Telescope colorscheme<cr>",
      desc = "Colorscheme",
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      "<leader>fH",
      "<cmd>Telescope highlights<cr>",
      desc = "Highlights",
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help",
    },
    {
      "<leader>fi",
      "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>",
      desc = "Media",
    },
    {
      "<leader>fk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
    },
    {
      "<leader>fl",
      "<cmd>Telescope resume<cr>",
      desc = "Last Search",
    },
    {
      "<leader>fM",
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages",
    },
    {
      "<leader>fp",
      "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
      desc = "Projects",
    },
    {
      "<leader>fR",
      "<cmd>Telescope registers<cr>",
      desc = "Registers",
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent File",
    },
    {
      "<leader>fs",
      "<cmd>Telescope grep_string<cr>",
      desc = "Find String",
    },
    {
      "<leader>ft",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Text",
    },
    -- git
    {
      "<leader>g",
      group = "Git",
    },
    {
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
    },
    {
      "<leader>gC",
      "<cmd>Telescope git_bcommits<cr>",
      desc = "Checkout commit(for current file)",
    },
    {
      "<leader>gc",
      "<cmd>Telescope git_commits<cr>",
      desc = "Checkout commit",
    },
    {
      "<leader>gd",
      "<cmd>Gitsigns diffthis HEAD<cr>",
      desc = "Git Diff",
      icon = {
        icon = " ",
        color = "orange"
      }
    },
    {
      "<leader>gf",
      "<cmd>Fugit2<cr>",
      desc = "Git Fugit2",
    },
    {
      "<leader>gg",
      "<cmd>Neogit<CR>",
      desc = "Neogit",
    },
    {
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
      desc = "Next Hunk",
    },
    {
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
      desc = "Prev Hunk",
    },
    {
      "<leader>gl",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      desc = "Blame",
    },
    {
      "<leader>go",
      "<cmd>Telescope git_status<cr>",
      desc = "Open changed file",
    },
    {
      "<leader>gp",
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      desc = "Preview Hunk",
    },
    {
      "<leader>gR",
      "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
      desc = "Reset Buffer",
    },
    {
      "<leader>gr",
      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
      desc = "Reset Hunk",
    },
    {
      "<leader>gs",
      "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
      desc = "Stage Hunk",
    },
    {
      "<leader>gu",
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      desc = "Undo Stage Hunk",
    },
    {
      "<leader>gY",
      "<cmd>GitLink blame<cr>",
      desc = "Git link blame",
    },
    {
      "<leader>gy",
      "<cmd>GitLink!<cr>",
      desc = "Git link",
    },
    -- hsplit
    {
      "<leader>h",
      "<cmd>split<CR>",
      desc = "HSplit",
      hidden = true,
    },
    -- lsp
    {
      "<leader>l",
      group = "LSP",
      icon = {
        icon = " ",
        color = "blue",
      },
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action"
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action",
      mode = { "v" },
    },
    {
      "<leader>le",
      "<cmd>Telescope quickfix<cr>",
      desc = "Telescope Quickfix",
    },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },

    {
      "<leader>lh",
      "<cmd>lua require('user.plugins.lspconfig').toggle_inlay_hints()<cr>",
      desc = "Hints",
    },
    {
      "<leader>lI",
      "<cmd>Mason<cr>",
      desc = "Mason Info"
    },
    {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "Info",
    },
    {
      "<leader>lj",
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      desc = "Next Diagnostic",
    },
    {
      "<leader>lk",
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      desc = "Prev Diagnostic",
    },
    {
      "<leader>ll",
      "<cmd>lua vim.lsp.codelens.run()<cr>",
      desc = "CodeLens Action",
    },
    {
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<cr>",
      desc = "Quickfix",
    },
    {
      "<leader>lr",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      desc = "Rename",
    },
    {
      "<leader>lS",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      desc = "Workspace Symbols",
    },
    {
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols<cr>",
      desc = "Document Symbols",
    },
    -- nohlsearch 
    {
      "<leader>N",
      "<cmd>nohlsearch<CR>",
      desc = "NOHL",
      hidden = true,
    },
    -- notes
    {
      "<leader>n",
      icon = {
        icon = "󰠮 ",
        color = "azure",
      },
      group = "Notes",
    },
    {
      "<leader>nf",
      "<cmd>Notes find<cr>",
      desc = "Find notes by title"
    },
    {
      "<leader>ng",
      "<cmd>Notes get<cr>",
      desc = "Get a list of all notes"
    },
    {
      "<leader>nw",
      "<cmd>Notes write<cr>",
      desc = "Write a new note"
    },
    -- nav
    {
      "<leader>o",
      "<cmd>Navbuddy<cr>",
      desc = "Nav",
      icon = {
        icon = "",
        color = "blue"
      }
    },
    -- plugins
    {
      "<leader>p",
      icon = {
        icon = " ",
        color = "azure",
      },
      group = "Plugins",
    },
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
      "<leader>pS",
      "<cmd>Lazy clear<cr>",
      desc = "Status",
    },
    {
      "<leader>ps",
      "<cmd>Lazy sync<cr>",
      desc = "Sync",
    },
    {
      "<leader>pu",
      "<cmd>Lazy update<cr>",
      desc = "Update",
    },
    {
      "<leader>s",
      group = "Sessions",
    },
    {
      "<leader>sa",
      function() require("persistence").load() end,
      desc = "Restore Session"
    },
    {
      "<leader>sd",
      "<cmd>Autosession delete<CR>",
      desc = "Delete Session"
    },
    {
      "<leader>sf",
      function() require("persistence").select() end,
      desc = "Select Session"
    },
    {
      "<leader>sl",
      function() require("persistence").load({ last = true }) end,
      desc = "Restore Last Session"
    },
    {
      "<leader>ss",
      function() require("persistence").stop() end,
      desc = "Don't Save Current Session"
    },
    -- treesitter
    {
      "<leader>T",
      group = "Treesitter",
    },
    {
      "<leader>Ti",
      "<cmd>TSConfigInfo<CR>",
      desc = "Info",
      hidden = true,
    },
    -- tests
    {
      "<leader>t",
      group = "Test",
    },
    {
      "<leader>ta",
      "<cmd>lua require('neotest').run.attach()<cr>",
      desc = "Attach Test",
    },
    {
      "<leader>td",
      "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
      desc = "Debug Test",
    },
    {
      "<leader>tf",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Test File",
    },
    {
      "<leader>ts",
      "<cmd>lua require('neotest').run.stop()<cr>",
      desc = "Test Stop",
    },
    {
      "<leader>tt",
      "<cmd>lua require'neotest'.run.run()<cr>",
      desc = "Test Nearest",
    },
    -- vertical split
    {
      "<leader>v",
      "<cmd>vsplit<CR>",
      desc = "VSplit",
      hidden = true,
    },
    -- quit
    {
      "<leader>q",
      "<cmd>confirm q<CR>",
      desc = "Quit",
    },
    -- wrap
    {
      "<leader>w",
      "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = "Wrap",
      hidden = true,
    },
    -- celullar
    {
      "<leader>y",
      "<cmd>CellularAutomaton make_it_rain<CR>",
      desc = "Rain",
      hidden = true,
    },
    -- zen-mode
    {
      "<leader>z",
      "<cmd>ZenMode<CR>",
      desc = "ZenMode",
      hidden = true,
    },
  }
end

return M
