local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local awful = require("awful")
local themes_path = gfs.get_themes_dir()

local theme = {}


theme.useless.gap = dpi(4)
theme.border_width = dpi(2)
theme.border_normal = "#61afef"

return theme
