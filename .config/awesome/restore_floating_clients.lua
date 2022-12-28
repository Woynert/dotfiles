-- Inspired from
-- https://bbs.archlinux.org/viewtopic.php?id=128623

local awful = require("awful")

local debug = false
local floatgeoms = {}
local prevFloatgeoms = {}



-- client moved to another tag
client.connect_signal("tagged", function (c)

	-- not during startup
    if awesome.startup then return end

	-- no maximized / fullscreen clients
    if c.maximized or c.fullscreen then return end

	-- only floating layout
	if not (c.first_tag.layout == awful.layout.suit.floating) then return end

	if debug then awful.spawn.with_shell("/bin/notify-send 'changed tag' ") end

	-- restore geometry
	floatgeoms[c.window] = prevFloatgeoms[c.window]
	c:geometry(prevFloatgeoms[c.window])


end)


-- on change layout
awful.tag.attached_connect_signal(nil, "property::layout", function (t)

	-- only floating layout
	if not (t.layout == awful.layout.suit.floating) then return end

	for k, c in ipairs(t:clients()) do

		-- no maximized / fullscreen clients
		if not c.fullscreen and not c.maximized then

			if debug then awful.spawn.with_shell("/bin/notify-send 'set geometry' " .. (floatgeoms[c.window].height)) end

			-- restore geometry
			c:geometry(prevFloatgeoms[c.window])

			prevFloatgeoms[c.window] = floatgeoms[c.window]
			floatgeoms[c.window]     = c:geometry()
			if debug then awful.spawn.with_shell("/bin/notify-send 'C store geometry " .. (floatgeoms[c.window].height)  .. "'") end

		end
	end
end)

client.connect_signal("property::geometry", function(c)

	-- not during startup
    if awesome.startup then return end

	-- no maximized / fullscreen clients
    if c.maximized or c.fullscreen then return end

	-- just in case
	if not c.first_tag then return end

	-- only floating layout
	if not (c.first_tag.layout == awful.layout.suit.floating) then return end

	-- store geometry
	prevFloatgeoms[c.window] = floatgeoms[c.window]
	floatgeoms[c.window]     = c:geometry()

	if debug then awful.spawn.with_shell("/bin/notify-send 'A store geometry " .. (floatgeoms[c.window].height)  .. "'") end

end)

-- client destruction
client.connect_signal("unmanage", function(c) floatgeoms[c.window] = nil end)    

-- client creation
client.connect_signal("manage", function(c)
	floatgeoms[c.window]     = c:geometry()
	prevFloatgeoms[c.window] = floatgeoms[c.window]

	if debug then awful.spawn.with_shell("/bin/notify-send 'B store geometry " .. (floatgeoms[c.window].height)  .. "'") end
end)

