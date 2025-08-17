-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local awful = require("awful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("modules.errors").handle_startup()
require("config.screens")
require("config.misc")
require("config.client")
awful.spawn.with_shell("picom")

