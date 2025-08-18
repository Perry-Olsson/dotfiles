local root = root

local menubar = require("menubar")
local beautiful = require("beautiful")
local settings = require("modules.settings")
local awful = require("awful")
local menu = require("modules.menu")
local gears = require("gears")
local keys = require("modules.keys")
local rules = require("modules.rules")

-- LAYOUTS
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

-- MENU
menubar.utils.terminal = settings.default_apps.terminal

-- THEME
beautiful.init("~/.config/awesome/gruvbox-theme/theme.lua")

-- MOUSE BINDINGS
root.buttons(gears.table.join(
    awful.button({ }, 3, function () menu.main_menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- KEYS
root.keys(keys.global_keys)

-- RULES
awful.rules.rules = rules
