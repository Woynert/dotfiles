-- Author: François de Metz
-- Author: Danver Braganza


local awful        = require("awful")
local naughty      = require("naughty")
local beautiful    = require("beautiful")
local wibox        = require("wibox")
local gears        = require("gears")

local pomodoro_time = 25 * 60 -- 25 min
local rest_time     = 5 * 60 -- 5 min
local current_time  = pomodoro_time

local pomodoro_image_none = beautiful.pomodoro_icon_none
  or awful.util.getdir("config") .."/pomodoro/images/gray.png"
local pomodoro_image_start = beautiful.pomodoro_icon_start
  or awful.util.getdir("config") .."/pomodoro/images/green.png"
local pomodoro_image_end = beautiful.pomodoro_icon_end
  or awful.util.getdir("config") .."/pomodoro/images/red.png"

local windup_path = beautiful.pomodoro_windup or awful.util.getdir("config") .."/pomodoro/sfx/winding_clock.mp3"
local ringing_path = beautiful.pomodoro_ringing or awful.util.getdir("config") .."/pomodoro/sfx/ringing_clock.mp3"


-- setup widget
local pomodoro = wibox.widget({
    image = pomodoro_image_none,
    widget = wibox.widget.imagebox
})

-- setup timers
local pomodoro_timer         = gears.timer({ timeout = current_time })
local pomodoro_tooltip_timer = gears.timer({ timeout = 1 })
local pomodoro_nbsec         = 0

local function pomodoro_start()
  pomodoro_timer:start()
  pomodoro_tooltip_timer:start()
  pomodoro.bg = beautiful.bg_normal
  pomodoro.image = pomodoro_image_start
  awful.util.spawn_with_shell("mpg123 " .. windup_path)
end

local function pomodoro_stop()
  pomodoro_timer:stop(pomodoro_timer)
  pomodoro_tooltip_timer:stop(pomodoro_tooltip_timer)
  pomodoro_nbsec = 0
  pomodoro.image = pomodoro_image_none
end

local function pomodoro_end()
  pomodoro_stop()
  pomodoro.bg = beautiful.bg_urgent
  pomodoro.image = pomodoro_image_end
  awful.util.spawn_with_shell("mpg123 " .. ringing_path)
end

local function pomodoro_notify(text)
  naughty.notify({ title = "Pomodoro", text = text, timeout = 10,
                   icon = pomodoro_image_path, icon_size = 64,
                   width = 200
  })
end

pomodoro_timer:connect_signal("timeout",
                              function(c)
                                pomodoro_end()
                                pomodoro_notify('Ended')
end)

pomodoro_tooltip_timer:connect_signal("timeout",
                                      function(c)
                                        pomodoro_nbsec = pomodoro_nbsec + 1
end)

local function timer_status()
  if pomodoro_timer.started then
    r = (current_time - pomodoro_nbsec) % 60
    return 'End in ' .. math.floor((current_time - pomodoro_nbsec) / 60) .. ' min ' .. r
  else
    return 'pomodoro not started'
  end
end


pomodoro_tooltip = awful.tooltip({
    objects = { pomodoro },
    timer_function = timer_status,
})

local function toggle()
  if not pomodoro_timer.started then
    pomodoro_start()
    pomodoro_notify('Started')
  else
    pomodoro_stop()
    pomodoro_notify('Canceled')
  end
end

function pomodoro:toggle_pomodoro()
  current_time = pomodoro_time
  pomodoro_timer.timeout = current_time
  toggle()
end

function pomodoro:toggle_rest()
  current_time = rest_time
  pomodoro_timer.timeout = current_time
  toggle()
end

function pomodoro:status()
    pomodoro_notify(timer_status())
end

pomodoro:buttons(awful.util.table.join(
                   awful.button({ }, 1, pomodoro.toggle_pomodoro), -- left click
                   awful.button({ }, 3, pomodoro.toggle_rest) -- right click
))

return pomodoro
