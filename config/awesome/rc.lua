-- {{{ Import libraries
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
-- }}}

tags ={}
-- {{{ Tags
for s = 1, screen.count() do
    tags[s] = awful.tag({ "ƀ", "Ƅ", "Ɗ", "ƈ", "ƙ" }, s,
			{ layout_tile, layout_tile, layout_tile, layout_floating, layout_floating })
end
-- }}}

-- Load basic config
dofile("/etc/xdg/awesome/rc.lua")

beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/dremora/theme.lua")

terminal = "st"
editor = "emacs"
editor_cmd = terminal .. " -e " .. editor

altkey = "Mod1"

local layout_tile = awful.layout.suit.tile.left
local layout_floating = awful.layout.suit.floating


