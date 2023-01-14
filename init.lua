require('kike.base')
require('kike.highlights')
require('kike.maps')
require('kike.bootstrap')
require('kike.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_lin = has "linux"

if is_mac then
  require('kike.macos')
end
if is_win then
  require('kike.windows')
end
if is_lin then
  require('kike.linux')
end
