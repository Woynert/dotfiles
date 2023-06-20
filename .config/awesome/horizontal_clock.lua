-- Author: Woynert

local awful        = require("awful")
local beautiful    = require("beautiful")
local wibox        = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- visuals

local theme = {}
theme.width = dpi(280)
theme.marker_width = dpi(4)
theme.horizontal_margin = dpi(3)
theme.bg_color1 = "#ffffff19"
theme.bg_color2 = "#ffffff30"
theme.bg_color_alert1 = "#583030"
theme.bg_color_alert2 = beautiful.plan_highlight
theme.marker_color = beautiful.plan_highlight
theme.bg_gradient = {
  type = 'linear',
  from = { 0, 0 },
  to = { theme.width, 0 },
  stops = {
    { 0.35, theme.bg_color1 },
    { 0.35, theme.bg_color2 },
    { 0.80, theme.bg_color2 },
    { 0.80, theme.bg_color1 },
  }
}
theme.bg_gradient_alert = {
  type = 'linear',
  from = { 0, 0 },
  to = { theme.width, 0 },
  stops = {
    { 0.35, theme.bg_color_alert1 },
    { 0.35, theme.bg_color_alert2 },
    { 0.80, theme.bg_color_alert2 },
    { 0.80, theme.bg_color_alert1 },
  }
}

-- widget

local clock = wibox.widget {
  widget = wibox.container.place,
  forced_width = theme.width,
  fill_horizontal = true,
  content_fill_horizontal = true,

  {
    widget = wibox.container.background,
    bg = theme.bg_gradient,
    id = "bg_role",

    {
      widget = wibox.container.margin,
      left = theme.horizontal_margin,
      right = theme.horizontal_margin,

      {
        layout = wibox.layout.stack,

        -- marker
        {
          widget = wibox.container.place,
          fill_horizontal = true,
          halign = "left",
          {
            widget = wibox.container.place,
            halign = "right",
            id = "marker_role",
            {
              widget = wibox.container.background,
              bg = beautiful.transparent,
              {
                widget = wibox.container.place,
                halign = "right",
                {
                  widget = wibox.container.background,
                  forced_width = theme.marker_width,
                  bg = theme.marker_color,
                  fg = theme.marker_color,
                  wibox.widget.textbox("."),
                }
              }
            }
          },
        },

        -- hour numbers
        {
          layout = wibox.layout.ratio.horizontal,
          inner_fill_strategy = "inner_spacing",

          {
            widget = wibox.widget.textbox(12),
            align = "left",
          },
          {
            widget = wibox.widget.textbox(24),
            align = "center"
          },
          {
            widget = wibox.widget.textbox(12),
            align = "right"
          },
        },
        {
          layout = wibox.layout.ratio.horizontal,
          inner_fill_strategy = "spacing",

          {
            widget = wibox.widget.textbox(18),
            align = "center"
          },
          {
            widget = wibox.widget.textbox(6),
            align = "center"
          },
        },

      },
    }
  }
}

-- logic

local flashOnOFF = false
local warning = false
local toggleWarningStart = 21
local toggleWarningEnd = 4
local timer
local timeout = 120
local timeoutWarning = 0.5
local setTimer

-- updates the widget. Takes the local hour and minutes to calculate the
-- marker's position, hour range beetween 12 to 12.

local update = function (widget, _, _, _, _)

  -- update marker position

  local time = os.date('*t')
  local xpos = time.hour + time.min / 60

  if time.hour >= 12 then
    xpos = xpos - 12
  elseif time.hour < 12 then
    xpos = xpos + 12
  end

  local width = math.max(theme.marker_width, (xpos / 24) * theme.width)
  widget:get_children_by_id('marker_role')[1].forced_width = width

  -- flash

  if warning then
    flashOnOFF = not flashOnOFF
    if flashOnOFF then
      widget:get_children_by_id('bg_role')[1].bg = theme.bg_gradient_alert
    else
      widget:get_children_by_id('bg_role')[1].bg = theme.bg_gradient
    end
  end

  -- toggle warning

  if time.hour >= toggleWarningStart or time.hour <= toggleWarningEnd then
    if not warning then
      setTimer(timeoutWarning)
    end
    warning = true

  else
    if warning then
      widget:get_children_by_id('bg_role')[1].bg = theme.bg_gradient
      setTimer(timeout)
    end
    warning = false

  end
end

setTimer = function (seconds)
  if timer ~= nil then
    timer.timeout = seconds
  else
    _, timer = awful.widget.watch("echo 1", seconds, update, clock)
  end
end

-- update every x seconds

setTimer(timeout)

return clock
