local M = {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
}

function M.config()
  local mc = require "multicursor-nvim"
  mc.setup {}

  -- Mappings defined in a keymap layer only apply when there are
  -- multiple cursors. This lets you have overlapping mappings.
  mc.addKeymapLayer(function(layerSet)
    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      else
        mc.clearCursors()
      end
    end)
  end)
end

return M
