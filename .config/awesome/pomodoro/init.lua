-- Author: François de Metz
-- Author: Danver Braganza
-- Author: Woynert

local awful        = require("awful")
local naughty      = require("naughty")
local beautiful    = require("beautiful")
local wibox        = require("wibox")
local gears        = require("gears")

local timer_secs = 25 * 60
local started_timer_secs = 0

local pomodoro_image_none = beautiful.pomodoro_icon_none
  or awful.util.getdir("config") .."/pomodoro/images/gray.png"
local pomodoro_image_start = beautiful.pomodoro_icon_start
  or awful.util.getdir("config") .."/pomodoro/images/green.png"
local pomodoro_image_end = beautiful.pomodoro_icon_end
  or awful.util.getdir("config") .."/pomodoro/images/red.png"

local windup_path = beautiful.pomodoro_windup or awful.util.getdir("config") .."/pomodoro/sfx/winding_clock.mp3"
local ringing_path = beautiful.pomodoro_ringing or awful.util.getdir("config") .."/pomodoro/sfx/ringing_clock.mp3"

local function format_time(time_seconds)
  minutes = math.floor(time_seconds/60)
  seconds = time_seconds % 60
  return tostring(minutes) .. ":" .. string.format("%02d", seconds)
end

-- setup widget
local pomodoro = wibox.widget({
    image = pomodoro_image_none,
    widget = wibox.widget.imagebox
})

-- setup timers
local pomodoro_timer         = gears.timer({ timeout = timer_secs })
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

local function pomodoro_notify(text, timeout_secs)
  naughty.notify({
    title     = "Pomodoro",
    text      = text,
    timeout   = timeout_secs,
    icon      = pomodoro_image_end,
    icon_size = 32,
    width     = 200
  })
end

pomodoro_timer:connect_signal("timeout",
  function(_)
    pomodoro_end()
    pomodoro_notify('Ended', 20)
  end)

pomodoro_tooltip_timer:connect_signal("timeout",
  function(_)
    pomodoro_nbsec = pomodoro_nbsec + 1
  end)

local function timer_status()
  if pomodoro_timer.started then
    return 'End in ' .. format_time(started_timer_secs - pomodoro_nbsec)
  else
    return 'Pomodoro not started (' .. format_time(timer_secs) .. ')'
  end
end

-- pomodoro tooltip

awful.tooltip({
    objects = { pomodoro },
    timer_function = timer_status,
})

local function toggle()
  if not pomodoro_timer.started then
    pomodoro_start()
    pomodoro_notify(format_time(started_timer_secs) .. ' started', 5)
  else
    pomodoro_stop()
    pomodoro_notify('Canceled', 5)
  end
end

local function notify_update()
  pomodoro_notify(format_time(timer_secs) .. " config", 1)
end

function pomodoro:start_5min()
  started_timer_secs = 5 * 60
  pomodoro_timer.timeout = started_timer_secs
  toggle()
end

function pomodoro:start()
  started_timer_secs = timer_secs
  pomodoro_timer.timeout = started_timer_secs
  toggle()
end

function pomodoro:decrease_time()
  if timer_secs <= (1 * 60) then return end

  decrease_minutes = 5
  if timer_secs <= (5 * 60) then
    decrease_minutes = 1
  end
  timer_secs = timer_secs - decrease_minutes * 60
  notify_update()
end

function pomodoro:increase_time()
  decrease_minutes = 5
  if timer_secs < (5 * 60) then
    decrease_minutes = 1
  end
  timer_secs = timer_secs + decrease_minutes * 60
  notify_update()
end

function pomodoro:status()
  pomodoro_notify(timer_status(), 5)
end

pomodoro:buttons(awful.util.table.join(
  awful.button({ }, 1, pomodoro.start), -- left click
  --awful.button({ }, 2, pomodoro.start_10min), -- middle click
  awful.button({ }, 3, pomodoro.start_5min), -- right click
  awful.button({ }, 4, pomodoro.increase_time), -- scroll up
  awful.button({ }, 5, pomodoro.decrease_time) -- scroll down
))

return pomodoro
