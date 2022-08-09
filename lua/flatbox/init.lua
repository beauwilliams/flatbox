local util = require("flatbox.util")
local theme = require("flatbox.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
