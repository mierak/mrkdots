local wibox = require("wibox")
local beautiful = require("beautiful")

local lain = require("lain")
local helpers = require("helpers")

local fs = lain.widget.fs {
    widget = wibox.widget { widget = wibox.widget.textbox, font = beautiful.fonts.bar },
    timeout = 1800,
    notification_preset = {
        border_width = 0
    },
    settings = function ()
        widget:set_markup(helpers.misc.colorize {
            text = string.format(" %.1f/%.1f%s", fs_now["/home"].used, fs_now["/home"].size, fs_now["/home"].units),
            fg = beautiful.fg_normal
        })
    end
}

return {
    widget = fs.widget,
}
