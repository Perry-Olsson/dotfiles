local awful = require("awful")
local beautiful = require("beautiful")
local debian = require("debian.menu")
local hotkeys_popup = require("awful.hotkeys_popup")
local has_fdo, freedesktop = pcall(require, "freedesktop")
local settings = require("modules.settings")

-- {{{ Menu
-- Create a launcher widget and a main menu
local awesome_menu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", settings.default_apps.terminal .. " -e man awesome" },
   { "edit config", settings.default_apps.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", awesome_menu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

local main_menu
if has_fdo then
    main_menu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    main_menu = awful.menu({
        items = {
                  menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian },
                  menu_terminal,
                }
    })
end

local launcher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = main_menu })
return {
    main_menu = main_menu,
    launcher = launcher
}
