local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
  },
}

function M.config()
  local dap = require "dap"
  local dapui = require "dapui"
  local icons = require "utils.icons"

  dapui.setup {
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          {
            id = "breakpoints",
            size = 0.25,
          },
          {
            id = "stacks",
            size = 0.25,
          },
          {
            id = "watches",
            size = 0.25,
          },
        },
        position = "right", -- Can be "left", "right", "top", "bottom"
        size = 40,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.5,
          },
          {
            id = "console",
            size = 0.5,
          },
        },
        position = "bottom",
        size = 10,
      },
    },
  }

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  require("nvim-dap-virtual-text").setup {
    enabled_commands = true,
  }

  require("which-key").add {
    {
      "<leader>db",
      function()
        dap.step_back()
      end,
      desc = "Step Back",
      icon = icons.debug.StepBack,
    },
    {
      "<leader>dc",
      function()
        dap.continue()
      end,
      desc = "Continue",
      icon = icons.debug.Continue,
    },
    {
      "<leader>dC",
      function()
        dap.run_to_cursor()
      end,
      desc = "Run To Cursor",
    },
    {
      "<leader>dd",
      function()
        dap.disconnect()
      end,
      desc = "Disconnect",
      icon = icons.debug.Disconnect,
    },
    {
      "<leader>de",
      function()
        dapui.eval()
      end,
      desc = "Evaluate Expression",
      mode = { "x" },
    },
    {
      "<leader>df",
      function()
        dapui.float_element()
      end,
      desc = "Display Floating Element",
    },
    {
      "<leader>dg",
      function()
        dap.session()
      end,
      desc = "Get Session",
    },
    {
      "<leader>di",
      function()
        dap.step_into()
      end,
      desc = "Step Into",
      icon = icons.debug.StepInto,
    },
    {
      "<leader>do",
      function()
        dap.step_over()
      end,
      desc = "Step Over",
      icon = icons.debug.StepOver,
    },
    {
      "<leader>dp",
      function()
        dap.pause()
      end,
      desc = "Pause",
      icon = icons.debug.Pause,
    },
    {
      "<leader>dq",
      function()
        dap.close()
      end,
      desc = "Stop",
      icon = icons.debug.Stop,
    },
    {
      "<leader>dr",
      function()
        dap.repl.toggle()
      end,
      desc = "Toggle Repl",
    },
    {
      "<leader>ds",
      function()
        dap.continue()
      end,
      desc = "Start",
      icon = icons.debug.Start,
    },
    {
      "<leader>dt",
      function()
        dap.toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>du",
      function()
        dap.step_out()
      end,
      desc = "Step Out",
      icon = icons.debug.StepOut,
    },
    {
      "<leader>dU",
      function()
        dapui.toggle { reset = true }
      end,
      desc = "Toggle UI",
    },
  }
end

return M
