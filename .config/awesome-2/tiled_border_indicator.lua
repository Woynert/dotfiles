local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local layout_to_use = "tile"
local titlebar_position = "left" -- pick a position not used by other titlebars

screen.connect_signal("arrange", function (s)
    local tiled = s.selected_tag.layout.name == layout_to_use
    local only_one = #s.tiled_clients <= 1

    -- iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
    for _, c in pairs(s.clients) do
        if c.type == "normal" and not only_one and tiled then
            if not c.side_titlebar then
                c.side_titlebar = awful.titlebar(c, {
                    size            = 3,
                    enable_tooltip  = false,
                    position        = titlebar_position,
                    bg_normal       = "#222324",
                })
                c.side_titlebar : setup {
                    widget = wibox.container.background,
                }
            end
        end
    end
end)

-- show / hide when on correct layout
awful.tag.attached_connect_signal(nil, "property::layout", function (t)
    if t.layout.name == layout_to_use then
        for k, c in ipairs(t:clients()) do
            if c.side_titlebar then
                awful.titlebar.show(c, titlebar_position)
            end
        end
    else
        for k, c in ipairs(t:clients()) do
            if c.side_titlebar then
                awful.titlebar.hide(c, titlebar_position)
            end
        end
    end
end)
