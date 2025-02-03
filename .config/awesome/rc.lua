pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end
-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Disable edge snap
awful.mouse.snap.edge_enabled = false

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
	awful.layout.suit.tile,
    awful.layout.suit.max,
}
-- }}}


-- {{{ Menu

-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}
local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }
if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  menu_terminal,
                }
    })
end
-- }}}



-- {{{ Wibar

-- custom system tray
dockablesys = require("mysystray")

-- pomodoro widget
pomodoro = require("pomodoro")

-- Create a textclock widget
mytextclock = wibox.widget.textclock("%b %d, %I:%M %P")
local month_calendar = awful.widget.calendar_popup.month({start_sunday=true})
month_calendar:attach( mytextclock, "br", {on_hover=true})

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
  if client.focus then
    client.focus:move_to_tag(t)
  end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
  if client.focus then
    client.focus:toggle_tag(t)
  end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
awful.button({ }, 1, function (c)
  if c == client.focus then
    c.minimized = true
  else
    c:emit_signal(
    "request::activate",
    "tasklist",
    {raise = true}
    )
  end
end),
awful.button({ }, 3, function()
  awful.menu.client_list({ theme = { width = 250 } })
end),
awful.button({ }, 4, function ()
  awful.client.focus.byidx(1)
end),
awful.button({ }, 5, function ()
  awful.client.focus.byidx(-1)
end))

local function set_wallpaper(s)
	-- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        --gears.wallpaper.maximized(wallpaper, s, true)
        gears.wallpaper.centered(wallpaper, s, beautiful.screen_bg, 0.01)
    end

    gears.wallpaper.set(beautiful.screen_bg)
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local vert_sep = wibox.widget {
    widget = wibox.widget.separator,
    orientation = "vertical",
    forced_width = beautiful.panel_text_separation,
    color = "#00000000",
}

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    -- Define tags
    -- awful.tag({ "1", "2", "3" }, s, awful.layout.layouts[1])
    -- awful.tag({ "1", "2", "3", "Q", "W" }, s, awful.layout.layouts[1])
    awful.tag({ "1", "2", "3", "Q", "W", "E"}, s, awful.layout.layouts[1])


	-- tags
	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		widget_template = {
			{
				{
                        {
                            {
                                {
                                    id     = 'text_role',
                                    widget = wibox.widget.textbox,
                                },
                                layout = wibox.layout.fixed.horizontal,
                            },
                            widget = wibox.container.place,
                            forced_width = beautiful.taglist_button_width
                        },
                        id     = 'background_role',
                        widget = wibox.container.background,
                },
                id     = 'bg',
                widget = wibox.container.background,
			},
			id     = 'root',
			widget = wibox.container.margin,
			create_callback = function(self, t, index, _)
                -- margin
                if index == 1 then
                    self.left = beautiful.panel_text_separation
                end
                if index == 3 or index == 6 then
                    self.right = beautiful.taglist_group_separation / 2
                end
                if index == 4 or index == 7 then
                    self.left = beautiful.taglist_group_separation / 2
                end
                -- color
                self:get_children_by_id('bg')[1].bg = beautiful.taglist_bg
			end,
		},
		buttons = taglist_buttons
	}

    -- icon tasklist
    s.mytasklist = awful.widget.tasklist {
	    screen   = s,
	    filter   = awful.widget.tasklist.filter.currenttags,
	    buttons  = tasklist_buttons,
	    layout   = {
            layout  = wibox.layout.fixed.horizontal
	    },
		widget_template = {
			nil,
            {
                {
                    {
                        -- horizontal bottom line
                        wibox.widget.base.make_widget(),
                        id            = "background_role",
                        widget        = wibox.container.background,
                    },
                    top = beautiful.panel_height - beautiful.tasklist_line_height,
                    widget = wibox.container.margin,
                },
                {
                    {
                        {
                            id = "clienticon",
                            widget = awful.widget.clienticon,
                            valign = 'center',
                        },
                        margins = 1,
                        id = "icon_margin",
                        widget = wibox.container.margin,
                    },
                    valign = 'center',
                    halign = 'center',
                    widget = wibox.container.place,
                },
                layout = wibox.layout.stack,
                forced_height = 40,
            },
            nil,
            forced_width = beautiful.tasklist_width,
			create_callback = function(self, client, _, _)
                self:get_children_by_id("clienticon")[1].client = client

			end,
			layout = wibox.layout.align.vertical,
		},
	}

    -- Create the wibox
    s.mywibox = awful.wibar({
        bg = beautiful.panel_bg,
        position = "bottom",
        ontop = false,
        screen = s,
        height = beautiful.panel_height,
        stretch = false,
        width = s.geometry.width * 0.6,
		border_width = 0,
		border_color = beautiful.final_bg_minimize,
    })

    s.mypromptbox = awful.widget.prompt()
	s.memory = wibox.container {
		widget = wibox.container.place,
		valign = "center",
		{
			widget = awful.widget.watch('/home/woynert/.config/awesome/script/memory.sh', 2),
		}
	}

    -- Add widgets to the wibox
    s.mywibox:setup {
      layout = wibox.layout.stack,
      {
        layout = wibox.layout.align.horizontal,
        -- Left widgets
        {
          layout = wibox.layout.fixed.horizontal,
          s.mytaglist,
		  vert_sep,
		  s.memory,
          vert_sep,
        },
        -- Middle widget
        {
          layout = wibox.layout.align.horizontal,
          inner_fill_strategy = "inner_spacing",
          wibox.widget.textbox(" "),
          {
            widget = wibox.container.place,
            valign = 'bottom',
            halign = 'center',
            s.mytasklist,
          },
        },
        -- Right widgets
        {
          layout = wibox.layout.fixed.horizontal,
          vert_sep,
          vert_sep,
          {
            widget = wibox.container.margin,
            margins = beautiful.tray_margin
          },
          {
            --pomodoro,
            dockablesys,
            widget = wibox.container.margin,
            left = beautiful.tray_margin/2,
            right = beautiful.tray_margin,
            up = beautiful.tray_margin,
            down = beautiful.tray_margin
          },
          -- battery widget (optional)
          {
            widget = awful.widget.watch('/home/woynert/.config/awesome/script/battery.sh', 10),
          },
		  vert_sep,
          mytextclock,
          vert_sep,
        },
      },
      {
        layout = wibox.layout.fixed.horizontal,
        vert_sep,
        s.mypromptbox,
        vert_sep,
      },
    }


end)
-- }}}


-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}


-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
			  {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control", "Shift" }, "Escape", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    --awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              --{description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.

-- Bind keyboard keycode to tags.
-- tagIndex:    Tag from 1 to 9
-- keycode:     Physical key (see xev)
-- displayChar: Char to display in help

local function addGlobalTagKey (tagIndex, keycode, displayChar)
	globalkeys = gears.table.join(globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. keycode,
				  function ()
						local screen = awful.screen.focused()
						local tag = screen.tags[tagIndex]
						if tag then
						   tag:view_only()
						end
				  end,
				  {description = "view tag #" .. displayChar, group = "tag"}),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. keycode,
				  function ()
					  local screen = awful.screen.focused()
					  local tag = screen.tags[tagIndex]
					  if tag then
						 awful.tag.viewtoggle(tag)
					  end
				  end,
				  {description = "toggle tag #" .. displayChar, group = "tag"}),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. keycode,
				  function ()
					  if client.focus then
						  local tag = client.focus.screen.tags[tagIndex]
						  if tag then
							  client.focus:move_to_tag(tag)
						  end
					 end
				  end,
				  {description = "move focused client to tag #" .. displayChar, group = "tag"}),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. keycode,
				  function ()
					  if client.focus then
						  local tag = client.focus.screen.tags[tagIndex]
						  if tag then
							  client.focus:toggle_tag(tag)
						  end
					  end
				  end,
				  {description = "toggle focused client on tag #" .. displayChar, group = "tag"})
	)
end

addGlobalTagKey(1, 1 + 9, 1)
addGlobalTagKey(2, 2 + 9, 2)
addGlobalTagKey(3, 3 + 9, 3)

addGlobalTagKey(4, 24, "Q")
addGlobalTagKey(5, 25, "W")
addGlobalTagKey(6, 26, "E")

-- # bindings needed for tags
-- Ctrl + Shift + Super + #
-- Ctrl + Super + #
-- Shift + Super + #
-- Super + #
-- 
-- # removed / changed default bindings
-- Shift + Super + Q // quit awesomewm
-- Super + W // show main menu
-- Super + S // show help
-- 
-- Shift + Super + X
-- [Deleted]
-- Super + X

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}


-- {{{ Rules

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = 0,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

	{
		rule_any = { type = { "desktop" } },
		callback = function(c)
			c.screen = awful.screen.getbycoord(0, 0)
		end,
		properties = {
			sticky = true,
			border_width = 0,
			skip_taskbar = true,
			titlebars_enabled = false,
			requests_no_titlebar = true,
			focusable = false,
			dockable = false,
			keys = {},
			screen = nil,
			size_hints_honor = false,
		},
		really_no_titlebar = true,
		side_titlebar = nil,
	},
}
-- }}}


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
	-- Set the window at the slave
	if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup
		and not c.size_hints.user_position
		and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)

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
        size = beautiful.titlebar_height,
        bg_normal = beautiful.titlebar_bg_normal,
        bg_focus  = beautiful.titlebar_bg_focus,
        position = 'top',
    }) : setup {
        widget = wibox.container.margin,
        margins = beautiful.titlebar_padding,
        {
            { -- Left
                awful.titlebar.widget.iconwidget(c),
                wibox.widget {
                    widget = wibox.widget.separator,
                    orientation = "vertical",
                    forced_width = beautiful.titlebar_icon_spacing,
                    color = "#00000000",
                },
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal
            },
            { -- Middle
                { -- Title
                    align  = "left",
                    widget = awful.titlebar.widget.titlewidget(c),
                    font = beautiful.titlebar_font,
                },
                buttons = buttons,
                layout  = wibox.layout.flex.horizontal
            },
            { -- Right
                --awful.titlebar.widget.floatingbutton (c),
                --awful.titlebar.widget.stickybutton   (c),
                {
                    widget = wibox.container.background,
                    forced_width = beautiful.titlebar_button_width,
                    awful.titlebar.widget.ontopbutton(c),
                },
                {
                    widget = wibox.container.background,
                    forced_width = beautiful.titlebar_button_width,
                    awful.titlebar.widget.minimizebutton(c),
                },
                {
                    widget = wibox.container.background,
                    forced_width = beautiful.titlebar_button_width,
                    awful.titlebar.widget.maximizedbutton(c),
                },
                {
                    widget = wibox.container.background,
                    forced_width = beautiful.titlebar_close_button_width,
                    awful.titlebar.widget.closebutton (c),
                },
                layout  = wibox.layout.fixed.horizontal(),
            },
            layout = wibox.layout.align.horizontal
        }
    }
end)

-- client fallback icon

client.connect_signal("manage", function(c)
    if c and c.valid and not c.icon then
        local default_icon = beautiful.tasklist_fallback_icon
        if not default_icon then return end
        -- returns false on failure
        local icon = gears.surface.load_silently(default_icon, false)
        if icon then c.icon = icon._native end
    end
end)
-- }}}


-- {{{{ Custom modules

-- 1. toggle titlebars when not floating
require('floating_titlebar_toggle')

-- 2. remember floating window positions
require('restore_floating_clients')

-- custom borders for tile layout
require('tiled_border_indicator')

-- welcome message     
awful.spawn("notify-send 'Welcome back'")

-- Startup programs
awful.spawn.with_shell("~/.config/awesome/script/autorun.sh")

-- }}}
