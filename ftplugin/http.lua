local icon = require "user.extras.icons"
local kulala = require "kulala"
local wk = require "which-key"

wk.add {
  -- Http
  {
    "<leader>H",
    group = "Http",
    icon = {
      icon = icon.misc.Rocket,
      color = "red",
    },
  },
  {
    "<leader>HC",
    function()
      kulala.from_curl()
    end,
    desc = "Paste From Curl",
    mode = { "n", "x" },
  },
  {
    "<leader>Hc",
    function()
      kulala.copy()
    end,
    desc = "Copy as cURL",
    mode = { "n", "x" },
  },
  {
    "<leader>Hd",
    function()
      kulala.ui.clear_responses_history()
    end,
    desc = "Clear responses history",
    mode = { "n", "x" },
  },
  {
    "<leader>He",
    function()
      kulala.set_selected_env()
    end,
    desc = "Select Environment",
    mode = { "n", "x" },
  },
  {
    "<leader>Hf",
    function()
      kulala.search()
    end,
    desc = "Search Request",
    mode = { "n", "x" },
  },
  {
    "<leader>Hl",
    function()
      kulala.replay()
    end,
    desc = "Replay The Last Request",
    mode = { "n", "x" },
  },
  {
    "<leader>HO",
    function()
      kulala.ui.show_script_output()
    end,
    desc = "Show Script Output",
    mode = { "n", "x" },
  },
  {
    "<leader>Ho",
    function()
      kulala.open()
    end,
    desc = "Open Kulala",
    mode = { "n", "x" },
  },
  {
    "<leader>Hq",
    function()
      kulala.close()
    end,
    desc = "Close Window",
    mode = { "n", "x" },
  },
  {
    "<leader>HS",
    function()
      kulala.show_stats()
    end,
    desc = "Show Stats",
    mode = { "n", "x" },
  },
  {
    "<leader>Hs",
    function()
      kulala.scratchpad()
    end,
    desc = "Open Scratchpad",
    mode = { "n", "x" },
  },
  {
    "<leader>HR",
    function()
      kulala.run_all()
    end,
    desc = "Send All Requests",
    mode = { "n", "x" },
  },
  {
    "<leader>Hr",
    function()
      kulala.run()
    end,
    desc = "Send Request",
    mode = { "n", "x" },
  },
  {
    "<leader>Ht",
    function()
      kulala.toggle_view()
    end,
    desc = "Toggle headers/body",
    mode = { "n", "x" },
  },
}
