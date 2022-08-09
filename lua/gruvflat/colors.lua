--[[ local the_palette = {
  dark0 = "#0d0e0f",
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#282828",
  background_dark = "#1d2021",
  background_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#DEDEDE",
  soft_gray = "#3c3836",
  soft_yellow = "#eebd35",
  green = "#98971a",
  bright_yellow = "#fabd2f",
  orange = "#d65d0e",
  red = "#fb4934",
  error_red = "#cc241d",
  magenta = "#b16286",
  pink = "#D4879C",
  light_blue = "#7fa2ac",
  dark_gray = "#83a598",
  blue_gray = "#458588",
  aqua = "#689d6a",
  clean_green = "#8ec07c",
  milk = "#E7D7AD",
  none = "NONE",
} ]]
local the_palette = {
  dark0 = "#0d0e0f",
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#282828",
  background_dark = "#1d2021",
  background_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  dark_gray = "#3c3836",
  darker_gray = "#7c6f64",
  gray = "#DEDEDE",
  soft_gray = "#3c3836",
  soft_yellow = "#eebd35",
  green = "#98971a",
  bright_yellow = "#fabd2f",
  orange = "#d65d0e",
  red = "#fb4934",
  error_red = "#cc241d",
  magenta = "#b16286",
  pink = "#D4879C",
  light_blue = "#7fa2ac",
  -- dark_gray = "#83a598", Blue?
  blue_gray = "#458588",
  aqua = "#689d6a",
  clean_green = "#8ec07c",
  milk = "#E7D7AD",
  none = "NONE",
}

-- these are backgrounds
the_palette.diff = {
  add = "#26332c",
  -- change = "#273842",
  change = "#38361D",
  delete = "#572E33",
  text = "#314753",
}

--[[ local original_palette = vim.tbl_extend("force", the_palette, {
  foreground = "#fbf1c7",
  aqua = "#85B374",
  green = "#B4C214",
  soft_yellow = "#FCBA2B",
  light_blue = "#8AB4B8",
  magenta = "#B28BB6",
  orange = "#FF7300",
  gray = "#928374",
  comment = "#928374",
  red = "#FF422D",
  background_light = "#2F2B2B",
}) ]]

local original_palette = vim.tbl_extend("force", the_palette, {
  foreground = "#d5c4a1",
  green = "#b8bb26",
  aqua = "#8ec07c",
  soft_yellow = "#fabd2f",
  light_blue = "#83a598",
  magenta = "#d3869b",
  orange = "#fe8019",
  gray = "#928374",
  comment = "#928374",
})

local M = {}

function M.config(config)
  config = config or require("flatbox.config")
  local colors
  if config.use_original_palette then
    colors = original_palette
  else
    colors = the_palette
  end

  local intensity_map = {
    ["dark"] = {
      dark = colors.dark0,
      background = colors.background,
      background_dark = colors.background_dark,
    },
    ["medium"] = {
      background = colors.background,
      background_dark = colors.background_dark,
    },
    ["light"] = {
      background = colors.background_light,
      background_dark = colors.background,
    },
    ["light_soft"] = {
      background = colors.background_light,
      background_dark = colors.background_light,
      t
    },
  }

  local background = config.background_color or colors.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    local transparent = {
      background = colors.none,
      background_dark = colors.none,
    }
    colors = vim.tbl_extend("force", colors, transparent)
  end
  return colors
end

function M.get_background_color()
  local config = require("flatbox.config")
  local colors = M.config(config)
  return colors.background
end

return M
