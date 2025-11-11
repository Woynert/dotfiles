local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
beautiful.titlebar_border_width = 6

local margin_offset = beautiful.titlebar_border_width / 3
local shade_0 = "#222222"
local shade_1 = "#555555"
local shade_2 = "#aaaaaa"
local shade_3 = "#ffffff"
local shade_bg = shade_1
local shade_bg_focused = "#5555ff"

function update_titlebars (c, with_rich_titlebar, focused)
    add_titlebar_borders(c, with_rich_titlebar, focused)
end

function add_rich_titlebar (c, focused)
	local shade_bg_local = shade_bg
	if focused then
		shade_bg_local = shade_bg_focused
	end

	-- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {
        size            = beautiful.titlebar_border_width + beautiful.titlebar_height,
        enable_tooltip  = false,
        position        = 'top',
        bg              = shade_0
    }) : setup {
        {
            {
                {
                    {
                        {
                            {
                                {
                                    { -- Left
                                        awful.titlebar.widget.iconwidget(c),
                                        buttons = buttons,
                                        layout  = wibox.layout.fixed.horizontal
                                    },
                                    { -- Middle
                                        {
                                            { -- Title
                                                align  = "left",
                                                widget = awful.titlebar.widget.titlewidget(c)
                                            },
                                            left = margin_offset * 2,
                                            layout = wibox.layout.margin
                                        },
                                        buttons = buttons,
                                        layout  = wibox.layout.flex.horizontal
                                    },
                                    { -- Right
                                        awful.titlebar.widget.floatingbutton (c),
                                        awful.titlebar.widget.maximizedbutton(c),
                                        awful.titlebar.widget.stickybutton   (c),
                                        awful.titlebar.widget.ontopbutton    (c),
                                        awful.titlebar.widget.closebutton    (c),
                                        layout = wibox.layout.fixed.horizontal()
                                    },
                                    layout = wibox.layout.align.horizontal
                                },
                                margins = margin_offset,
                                bottom = 0,
                                widget = wibox.container.margin,
                            },
                            bg = shade_bg_local,
                            widget = wibox.container.background,
                        },
                        color = shade_2,
                        right = margin_offset,
                        left = margin_offset,
                        top = margin_offset,
                        bottom = 0,
                        widget = wibox.container.margin,
                    },
                    color = shade_3,
                    top = margin_offset,
                    left = margin_offset,
                    widget = wibox.container.margin,
                },
                color = shade_1,
                right = margin_offset,
                widget = wibox.container.margin,
            },
            color = shade_2,
            top = margin_offset,
            left = margin_offset,
            widget = wibox.container.margin,
        },
        color = share_0,
        right = margin_offset,
        widget = wibox.container.margin,
    }
end

function add_titlebar_borders (c, with_rich_titlebar, focused)
    --if with_rich_titlebar then
    if with_rich_titlebar or focused then
        add_rich_titlebar(c, focused)
    else
        awful.titlebar(c, {
            size            = beautiful.titlebar_border_width,
            enable_tooltip  = false,
            position        = 'top',
            bg              = shade_0
        }) : setup {
            {
                {
                    {
                        {
                            {
                                widget = wibox.widget.textbox(""),
                            },
                            bg = shade_2,
                            widget = wibox.container.background,
                        },
                        color = shade_3,
                        top = margin_offset,
                        left = margin_offset,
                        widget = wibox.container.margin,
                    },
                    color = shade_1,
                    right = margin_offset,
                    widget = wibox.container.margin,
                },
                color = shade_2,
                top = margin_offset,
                left = margin_offset,
                widget = wibox.container.margin,
            },
            color = share_0,
            right = margin_offset,
            widget = wibox.container.margin,
        }
    end

    awful.titlebar(c, {
        size            = beautiful.titlebar_border_width,
        enable_tooltip  = false,
        position        = 'bottom',
        bg              = shade_0
    }) : setup {
        {
            {
                {
                    {
                        {
                            widget = wibox.widget.textbox(""),
                        },
                        bg = shade_2,
                        widget = wibox.container.background,
                    },
                    color = shade_3,
                    left = margin_offset,
                    widget = wibox.container.margin,
                },
                color = shade_1,
                right = margin_offset,
                bottom = margin_offset,
                widget = wibox.container.margin,
            },
            color = shade_2,
            left = margin_offset,
            widget = wibox.container.margin,
        },
        color = shade_0,
        right = margin_offset,
        bottom = margin_offset,
        widget = wibox.container.margin,
    }

    awful.titlebar(c, {
        size            = beautiful.titlebar_border_width,
        enable_tooltip  = false,
        position        = 'right',
        bg              = shade_0
    }) : setup {
        {
            {
                {
                    widget = wibox.widget.textbox(""),
                },
                bg = shade_2,
                widget = wibox.container.background,
            },
            color = shade_1,
            right = margin_offset,
            widget = wibox.container.margin,
        },
        color = shade_0,
        right = margin_offset,
        widget = wibox.container.margin,
    }
    
    awful.titlebar(c, {
        size            = beautiful.titlebar_border_width,
        enable_tooltip  = false,
        position        = 'left',
        bg              = shade_0
    }) : setup {
        {
            {
                {
                    widget = wibox.widget.textbox(""),
                },
                bg = shade_2,
                widget = wibox.container.background,
            },
            color = shade_3,
            right = margin_offset,
            widget = wibox.container.margin,
        },
        color = shade_2,
        right = margin_offset,
        widget = wibox.container.margin,
    }
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    update_titlebars(c, true, c.focused)
end)

-- Rerequest titlebars when resized
client.connect_signal("property::size", function(c)
    update_titlebars(c, true, c.focused)
end)

client.connect_signal("focus", function(c)
	c.focused = true
    update_titlebars(c, true, c.focused)
end)

client.connect_signal("unfocus", function(c)
	c.focused = false
    update_titlebars(c, true, c.focused)
end)
