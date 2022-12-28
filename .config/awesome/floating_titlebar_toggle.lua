-- show title bars only on floating mode
--
-- inspired from
-- https://github.com/mphe/dotfiles/blob/5d111e4a74e1b29a5b556b58bccd47a1adf0cc8a/configdir/awesome/rc.lua

local awful = require("awful")
local debug = false

local function refreshMaximize(c)
	-- remaximize
	if c.maximized then
		c.maximized = false
		c.maximized = true
	end

	-- refullscreen
	if c.fullscreen then
		c.fullscreen = false
		c.fullscreen = true
	end
end

local function refreshTitlebar(c)

	if debug then awful.spawn.with_shell("/bin/notify-send 'refresh titlebar'") end
	
	-- is current layout floating?
    local float = c.first_tag.layout == awful.layout.suit.floating 

	--if float and not c.maximized and not c.requests_no_titlebar then
	if float and not c.requests_no_titlebar then
		awful.titlebar.show(c)
	else
		awful.titlebar.hide(c)
	end

	-- shadow ?
	--if c.floating and not c.maximized and not c.fullscreen then
		--awful.spawn("xprop -id " .. c.window .. " -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 1")
	--else
		--awful.spawn("xprop -id " .. c.window .. " -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 0")
	--end
end

-- on change layout
awful.tag.attached_connect_signal(nil, "property::layout", function (t)
	local float = t.layout.name == "floating"
	for _,c in pairs(t:clients()) do
		refreshTitlebar(c)
		refreshMaximize(c)
	end
end)

-- new client appears.
client.connect_signal("manage", function (c)
	refreshTitlebar(c)
end)

-- client moved to another tag
client.connect_signal("tagged", function (c, ...)
	refreshTitlebar(c)
	refreshMaximize(c)
	--return awful.ewmh.geometry(c, ...)
end)

-- Hide titlebar when maximized
-- Needs request::geometry because when property::maximized is called,
-- the window was already transformed, not filling up the space freed by hiding titlebar.
client.disconnect_signal("request::geometry", awful.ewmh.geometry)
client.connect_signal("request::geometry", function(c, ...)
	refreshTitlebar(c)
	return awful.ewmh.geometry(c, ...)
end)

