local beautiful = require("beautiful")

beautiful.parent_filter_list = {
    "Vivaldi%-stable",
    "code-oss",
    "code",
    "discord",
    "firefox",
    "Microsoft Teams %- Preview",
    "krita",
    "Skype",
    "Pcmanfm",
    "Virt%-manager",
    "KeePassXC"
}
beautiful.dont_swallow_filter_activated  = true

local bling = require("bling")
bling.module.window_swallowing.start()

