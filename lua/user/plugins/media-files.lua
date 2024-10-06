local M = {
  "nvim-telescope/telescope-media-files.nvim"
}

function M.confi()
  require('telescope').setup {
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg"},
        -- find command (defaults to `fd`)
        find_cmd = "rg"
      }
    },
  }
end

return M
