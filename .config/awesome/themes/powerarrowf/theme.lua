---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")

local theme = {}

-- Setup Paths
local gfs = require("gears.filesystem")
pathToConfig = os.getenv("HOME") .. "/.config/awesome/themes/powerarrowf"

theme.nord0  = "#2E3440"
theme.nord1  = "#3B4252"
theme.nord2  = "#434C5E"
theme.nord3  = "#4C566A"
theme.nord4  = "#D8DEE9"
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#81A1C1"
theme.nord10 = "#5E81AC"
theme.nord11 = "#BF616A"
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.font          = "Roboto 12"
theme.transparent = "#000000"

theme.bg_normal     = theme.nord0
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.nord4
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.border_width  = 1
theme.useless_gap = 4
theme.border_normal = theme.nord9
theme.border_focus  = theme.nord9
theme.border_marked = theme.nord11

theme.tasklist_bg_focus = theme.nord0
theme.tasklist_icon_size = 5
theme.tasklist_plain_task_name = true

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.taglist_spacing = dpi(5)

-- Display the taglist squares
theme.taglist_squares_sel   = pathToConfig .. "powerarrowf/icons/square_sel.png"
theme.taglist_squares_unsel = pathToConfig .. "powerarrowf/icons/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path.. "../default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

theme.wallpaper = pathToConfig .. "powerarrowf/1213388.jpg"

-- You can use your own layout icons like this:
theme.layout_floating  = pathToConfig .. "powerarrowf/layouts/floating.png"
theme.layout_tilebottom = pathToConfig  .. "powerarrowf/layouts/tilebottom.png"
theme.layout_tileleft   = pathToConfig .. "powerarrowf/layouts/tileleft.png"
theme.layout_tile = pathToConfig .. "powerarrowf/layouts/tile.png"
theme.layout_tiletop = pathToConfig .. "powerarrowf/layouts/tiletop.png"

--{{ For the Dark Theme }} --

theme.arrl = pathToConfig .. "powerarrowf/icons/arrl.png"
theme.arrl_ld = pathToConfig .. "powerarrowf/icons/arrl_ld.png"
theme.arrl_dl = pathToConfig .. "powerarrowf/icons/arrl_dl.png"

--{{ For the time and date clock icon }} --
theme.clock = pathToConfig .. "powerarrowf/icons/myclocknew.png"

--{{ For the wifi icon }} --
theme.netlow = pathToConfig .. "powerarrowf/icons/netlow.png"
theme.netmed = pathToConfig .. "powerarrowf/icons/netmedium.png"
theme.nethigh = pathToConfig .. "powerarrowf/icons/nethigh.png"

--{{ For the charging (AC adaptor) icon }} --
theme.ac = pathToConfig .. "powerarrowf/icons/ac.png"

--{{ For the hard drive icon }} --
theme.hdd = pathToConfig .. "powerarrowf/icons/hdd.png"

--{{ For the volume icons }} --
theme.mute = pathToConfig .. "powerarrowf/icons/mute.png"
theme.music = pathToConfig .. "powerarrowf/icons/music.png"

--{{ For the CPU icon }} --
theme.cpu = pathToConfig .. "powerarrowf/icons/cpu.png"

--{{ For the Memory icon }} --
theme.mem = pathToConfig .. "powerarrowf/icons/mem.png"

--{{ For the mail icons }} --
theme.mail = pathToConfig .. "powerarrowf/icons/mail.png"
theme.mailopen = pathToConfig .. "powerarrowf/icons/mailopen.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.nord13
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = theme.nord14
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_fg_empty = theme.nord9
theme.taglist_bg_urgent = theme.bg_normal
theme.taglist_fg_urgent = theme.nord11

return theme
