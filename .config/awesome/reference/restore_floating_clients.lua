-- Extracted from
-- https://gist.github.com/gitaarik/c28511f0a7a94a2b23d6b64a306584c9
--
-- Restore last used floating client geometry (with / height / position) when
-- switching layouts and unmaximizing clients.
--
-- When unmaximizing a never-before floating client, it will nicely center the
-- client in the middle of the screen.
--
-- To use, just `require('restore_floating_clients')` in your `awesome/lua.rc`
-- Somewhere where you have your other signal callbacks.

local awful = require("awful")
awful.spawn.with_shell("/bin/notify-send huahua")

-- The following variables contain different states of clients, with the
-- `client.window` in the key and the relevant state in the value.

-- Store the floating clients geometries (with / height / position), so we can
-- restore the clients when the layout changes.
local floating_client_geometries = {}

-- Store the previous floating clients geometries. We need this to restore from
-- maximized, because the maximized signal happens after the geometry signal.
-- So the state we want to revert to gets overridden before we can restore it.
-- Therefore we also store the previous floating client geometries.
local prev_floating_client_geometries = {}

-- Store whether a client was NOT maximized in the last used floating layout.
-- We use this to determin whether a client should become maximized or floating
-- when switching to floating layout.
local unmaximized_state = {}

-- Store on which screen a client is. This is needed because when setting the
-- geometry of a client, the client seems to get moved to the first screen
-- regardless of which screen it was on.
local clients_screens = {}


-- When the geometry of a client changes, and the layout is floating, then
-- store the client's maximized state. And if the client is also not maximized,
-- then also store the client's geometry. This will be used to restore the
-- client's geometry when they become floating again.
client.connect_signal("property::geometry", function(c)

    clients_screens[c.window] = c.screen

    if (
        awesome.startup
        or awful.layout.get(awful.screen.focused()) ~= awful.layout.suit.floating
    ) then
        -- Don't store anything during startup, or when we're not in a floating
        -- layout.
        return
    end

    -- Store the unmaximized state
    unmaximized_state[c.window] = not c.maximized

    if c.maximized then
        -- Don't store geometry for maximized clients
        return
    end

    if floating_client_geometries[c.window] then
        -- Store the previous client geometry, before saving new one, for
        -- the unmaximize trigger.
        prev_floating_client_geometries[c.window] = floating_client_geometries[c.window]
    end

    -- Store client geometry
    floating_client_geometries[c.window] = c:geometry()

end)


-- When the layout changes, then if the layout is floating, restore the
-- geometry of clients that were not maximized the last time the floating
-- layout was used, if there is any previously stored geometry to restore.
tag.connect_signal("property::layout", function(t)

    if t.layout == awful.layout.suit.floating then

        for k, c in ipairs(t:clients()) do

            if (
                floating_client_geometries and unmaximized_state
                and floating_client_geometries[c.window]
                and unmaximized_state[c.window]
            ) then
                -- Restore client geometry
                c:geometry(floating_client_geometries[c.window])
            else
                -- If the client was maximized in the last used floating layout,
                -- or if there's no geometry to restore, just set the client to
                -- maximized.
                c.maximized = true
            end

        end

    else
        -- If the layout is not floating, then remove the maximized state from
        -- all clients, otherwise those layouts don't work properly.
        for k, c in ipairs(t:clients()) do c.maximized = false end
    end

end)

-- When changing a maximized client to unmaximized in a floating layout, then
-- restore the floating client geometry to what it was in the previous floating
-- state.
client.connect_signal("property::maximized", function(c)

    if (
        c.maximized
        or awful.layout.get(awful.screen.focused()) ~= awful.layout.suit.floating
    ) then
        -- If the client is maximized, or the layout is not floating, don't
        -- restore anything.
        return
    end

    if prev_floating_client_geometries[c.window] then
        -- Restore client geometry
        c:geometry(prev_floating_client_geometries[c.window])
    else

        -- If there is no previous geometry state, then center the client nicely in the
        -- middle of the screen, so that it's not off bounds or in a corner or
        -- extremely small or anything. Then it's easy to move / resize the floating
        -- client to your wish.

        local g = c.screen.geometry

        c:geometry({
            x = g.width / 6,
            y = g.height / 6,
            width = g.width / 1.5,
            height = g.height / 1.5
        })

        -- Restore the client screen, because this seems to get lost due to the
        -- `c:geometry()` call. This issue only occurs when you have multiple
        -- screens in use.
        c.screen = clients_screens[c.window]

    end

end)


-- When a new client appears, reset the geometry states. Because this signal
-- comes after the geometry signal, and the geometry signal in this case stores
-- incorrect geometries for a new client. So since this signal comes after the
-- geometry signal, we can reset it, so a new client starts with a blank slate.
client.connect_signal("manage", function (c)
    floating_client_geometries[c.window] = nil
    prev_floating_client_geometries[c.window] = nil
end)

