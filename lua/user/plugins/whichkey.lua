local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local icon = require "user.extras.icons"
  local snacks = require "snacks"
  local wk = require "which-key"

  -- Setup
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
      padding = { 1, 2 }, -- Extra window padding [top/bottom, right/left]
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
  -- Keys
  -- Icon colors: azure, blue, cyan, green, grey, orange, purple, red, yellow
  wk.add {
    -- Commands
    {
      "<c-/>",
      function()
        snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
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
    {
      "<leader>h",
      "<cmd>split<CR>",
      desc = "HSplit",
      hidden = true,
    },
    {
      "<leader>v",
      "<cmd>vsplit<CR>",
      desc = "VSplit",
      hidden = true,
    },
    {
      "<leader>w",
      "<cmd>lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = "Wrap",
      hidden = true,
    },
    -- Tab
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
    -- Buffers
    {
      "<leader>b",
      group = "Buffers",
    },
    {
      "<leader>bd",
      function()
        snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    -- Dap
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
    -- File Explorer
    {
      "<leader>e",
      function()
        snacks.explorer()
      end,
      desc = "File Explorer",
      icon = {
        icon = "",
        color = "green",
      },
    },
    -- Find
    {
      "<leader>f",
      group = "Find",
    },
    {
      "<leader>fb",
      function()
        snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fb",
      function()
        snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>fc",
      function()
        snacks.picker.files { cwd = vim.fn.stdpath "config" }
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>fG",
      function()
        snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>fw",
      function()
        snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- Git
    {
      "<leader>g",
      group = "Git",
    },
    {
      "<leader>gb",
      function()
        snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    {
      "<leader>gB",
      function()
        snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    -- LSP
    {
      "<leader>l",
      group = "LSP",
      icon = {
        icon = icon.ui.Code,
        color = "blue",
      },
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action",
    },
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      desc = "Code Action",
      mode = { "v" },
    },
    {
      "<leader>ld",
      function()
        snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    {
      "<leader>lD",
      function()
        snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "<leader>lr",
      function()
        snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "Info",
    },
    {
      "<leader>lI",
      function()
        snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "<leader>lm",
      "<cmd>Mason<cr>",
      desc = "Mason Info",
    },
    {
      "<leader>ll",
      "<cmd>lua vim.lsp.codelens.run()<cr>",
      desc = "CodeLens Action",
    },
    {
      "<leader>lr",
      "<cmd>lua vim.lsp.buf.rename()<cr>",
      desc = "Rename",
    },
    {
      "<leader>lR",
      function()
        snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>ls",
      function()
        snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>lS",
      function()
        snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>lq",
      "<cmd>lua vim.diagnostic.setloclist()<cr>",
      desc = "Quickfix",
    },
    {
      "<leader>ly",
      function()
        snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    -- Nav
    {
      "<leader>o",
      "<cmd>Navbuddy<cr>",
      desc = "Nav",
      icon = {
        icon = icon.misc.CircuitBoard,
        color = "blue",
      },
    },
    -- Plugins
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
    -- Search
    {
      "<leader>s",
      group = "Search",
    },
    {
      "<leader>s/",
      function()
        snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sa",
      function()
        snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sb",
      function()
        snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sc",
      function()
        snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sm",
      function()
        snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sp",
      function()
        snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sq",
      function()
        snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      '<leader>sr',
      function()
        snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>sR",
      function()
        snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    -- Tests
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
    -- UI
    {
      "<leader>u",
      group = "UI",
    },
    {
      "<leader>uc",
      function()
        snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    {
      "<leader>uh",
      function()
        snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>uk",
      -- "<cmd>Screenkey toggle<cr>"
      "<cmd>ShowkeysToggle<cr>",
      desc = "Screenkey toggle",
    },
    {
      "<leader>un",
      function()
        snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>up",
      "<cmd>Precognition toggle<cr>",
      desc = "Precognition toggle",
    },
    {
      "<leader>uz",
      function()
        snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>uZ",
      function()
        snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    -- Quit
    {
      "<leader>q",
      "<cmd>confirm q<CR>",
      desc = "Quit",
    },
  }
end

return M
