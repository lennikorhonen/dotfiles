-- =============
-- INIT
-- =============

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local task_list = require("widgets.task-list")

local top_panel = {}

-- =============
-- CREATE
-- =============

top_panel.create = function(s)
    local panel = awful.wibar({
        screen = s,
        position = "top",
        ontop = true,
        height = beautiful.top_panel_height,
        width = s.geometry.width,
    })
    panel:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        task_list.create(s),
        require("widgets.calendar"),
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(wibox.widget.systray(), 0, 0, 3, 3),
            require("widgets.network")(),
            require("widgets.layout-box")
        }
    }

    -- =============
    -- FUNCTIONS
    -- =============

    local function change_panel_visibility(client)
        panel.ontop = not client.fullscreen
    end

    client.connect_signal("property::fullscreen", change_panel_visibility)
    client.connect_signal("focus", change_panel_visibility)
    client.connect_signal("unfocus", change_panel_visibility)

end

return top_panel