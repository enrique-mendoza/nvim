local icon = require "user.extras.icons"
local kulala = require "kulala"
local wk = require "which-key"

wk.add {
  -- Http
  {
    "<leader>H",
    group = "Http",
    icon = icon.misc.Rocket,
  },
  {
    "<leader>Ha",
    function()
      kulala.run_all()
    end,
    desc = "Send Request",
    mode = { "n", "v" },
  },
  {
    "<leader>HC",
    function()
      kulala.from_curl()
    end,
    desc = "Paste From Curl",
    mode = { "n", "v" },
  },
  {
    "<leader>Hc",
    function()
      kulala.copy()
    end,
    desc = "Copy as cURL",
    mode = { "n", "v" },
  },
  {
    "<leader>He",
    function()
      kulala.set_selected_env()
    end,
    desc = "Select Environment",
    mode = { "n", "v" },
  },
  {
    "<leader>Hf",
    function()
      kulala.search()
    end,
    desc = "Search Request",
    mode = { "n", "v" },
  },
  {
    "<leader>HO",
    function()
      kulala.ui.show_script_output()
    end,
    desc = "Show Script Output",
    mode = { "n", "v" },
  },
  {
    "<leader>Ho",
    function()
      kulala.open()
    end,
    desc = "Open Kulala",
    mode = { "n", "v" },
  },
  {
    "<leader>HS",
    function()
      kulala.show_stats()
    end,
    desc = "Show Stats",
    mode = { "n", "v" },
  },
  {
    "<leader>Hs",
    function()
      kulala.run()
    end,
    desc = "Send Request",
    mode = { "n", "v" },
  },
  {
    "<leader>Hr",
    function()
      kulala.replay()
    end,
    desc = "Replay The Last Request",
    mode = { "n", "v" },
  },
  {
    "<leader>Ht",
    function()
      kulala.toggle_view()
    end,
    desc = "Toggle headers/body",
    mode = { "n", "v" },
  },
  {
    "<leader>Hq",
    function()
      kulala.close()
    end,
    desc = "Close Window",
    mode = { "n", "v" },
  },
  {
    "<leader>Hx",
    function()
      kulala.ui.clear_responses_history()
    end,
    desc = "Clear responses history",
    mode = { "n", "v" },
  },
}
