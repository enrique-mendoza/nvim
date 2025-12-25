local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  local icons = require "utils.icons"
  local snacks = require "snacks"

  snacks.setup {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      layout = "ivy",
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = {
      enabled = true,
      debounce = 0,
    },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
    zen = {
      enabled = true,
      toggles = {
        ufo = true,
        dim = true,
        git_signs = false,
        diagnostics = false,
        line_number = false,
        relative_number = false,
        signcolumn = "no",
        indent = false,
      },
    },
  }

  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        snacks.debug.inspect(...)
      end
      _G.bt = function()
        snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command

      -- Create some toggle mappings
      snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
      snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
      snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
      snacks.toggle.diagnostics():map "<leader>ud"
      snacks.toggle.line_number():map "<leader>ul"
      snacks.toggle
        .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
        :map "<leader>uC"
      snacks.toggle.treesitter():map "<leader>uT"
      snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>ub"
      snacks.toggle.inlay_hints():map "<leader>ui"
      snacks.toggle.indent():map "<leader>ug"
      snacks.toggle.dim():map "<leader>uD"
      snacks.toggle.new {
        id = "ufo",
        name = "Enable/Disable ufo",
        get = function()
          return require("ufo").inspect()
        end,
        set = function(state)
          if state == nil then
            require("noice").enable()
            require("ufo").enable()
            vim.o.foldenable = true
            vim.o.foldcolumn = "1"
          else
            require("noice").disable()
            require("ufo").disable()
            vim.o.foldenable = false
            vim.o.foldcolumn = "0"
          end
        end,
      }
    end,
  })

  require("which-key").add {
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
    -- Buffers
    {
      "<leader>ed",
      function()
        snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>eD",
      function()
        snacks.bufdelete.other()
      end,
      desc = "Delete Other Buffers",
    },
    {
      "<leader>es",
      function()
        snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>eS",
      function()
        snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    -- Find
    {
      "<leader>fb",
      function()
        snacks.picker.buffers()
      end,
      desc = "Buffers",
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
      "<leader>ft",
      function()
        snacks.picker.todo_comments()
      end,
      desc = "TODO",
    },
    {
      "<leader>fT",
      function()
        snacks.picker.todo_comments {
          keywords = { "TODO", "FIX", "FIXME" },
        }
      end,
      desc = "TODO/FIX/FIXME",
    },
    -- Git
    {
      "<leader>gb",
      function()
        snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gD",
      function()
        snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
      icon = {
        icon = icons.git.Diff,
        color = "orange",
      },
    },
    {
      "<leader>gf",
      function()
        snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    {
      "<leader>gg",
      function()
        snacks.lazygit()
      end,
      desc = "Lazygit",
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
      "<leader>go",
      function()
        snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
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
    -- LSP
    {
      "<leader>ld",
      function()
        snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "<leader>ld",
      function()
        snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "<leader>lD",
      function()
        snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "<leader>li",
      function()
        snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
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
      "<leader>lt",
      function()
        snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto Type Definition",
    },
    {
      "<leader>lu",
      function()
        snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    -- Search
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
      "<leader>sB",
      function()
        snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
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
      "<leader>sg",
      function()
        snacks.picker.grep {
          -- include files ignored by .gitignore
          args = { "--no-ignore" },
        }
      end,
      desc = "Grep",
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
      "<leader>sR",
      function()
        snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>st",
      function()
        snacks.picker.treesitter()
      end,
      desc = "Treesitter",
    },
    {
      "<leader>su",
      function()
        snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>sw",
      function()
        snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>sz",
      function()
        snacks.picker.zoxide()
      end,
      desc = "Zoxide",
    },
    {
      '<leader>s"',
      function()
        snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>s/",
      function()
        snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    -- UI
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
      "<leader>un",
      function()
        snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
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
  }
end

return M
