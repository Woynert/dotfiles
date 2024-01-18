local awful        = require("awful")
local wibox        = require("wibox")
--local gears        = require("gears")

local opened = true
local textbox = wibox.widget.textbox()
local pomodoro = require("pomodoro")
local systray_widget = wibox.widget ({
  wibox.widget.systray(),
  pomodoro,
  layout = wibox.layout.fixed.horizontal
})

local tray = wibox.widget ({
  systray_widget,
  textbox,
  layout = wibox.layout.fixed.horizontal
})

-- state functions

function tray:update ()
  if opened then
    textbox.text = " >tray"
    systray_widget.visible = true
  else
    textbox.text = " +tray"
    systray_widget.visible = false
  end
end

function tray:toggle ()
  opened = not opened
  tray:update()
end

-- input

tray:buttons(awful.util.table.join(
  awful.button({ }, 1, tray.toggle) -- left click
))

tray:update()

-- auto close on startup

--local timer = gears.timer { timeout = 1 }

--timer:connect_signal("timeout", function ()
  --opened = false
  --tray:update()
  --timer:stop()
--end)

--timer:start()

return tray
