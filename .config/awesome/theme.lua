---------------------------
-- Default awesome theme --
---------------------------
--
-- some reference:
-- https://github.com/alfunx/.dotfiles/blob/master/.config/awesome/themes/blackout/theme.lua#L256-L263


--local t_util           = require("config.util_theme")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme_dir = os.getenv("HOME") .. "/.config/awesome/"

local surface = require("gears.surface")
local shape = require("gears.shape")

-- gruvbox colors
local colors = { }

colors.black_1          = "#282828"
colors.black_2          = "#928374"
colors.red_1            = "#cc241d"
colors.red_2            = "#fb4934"
colors.green_1          = "#98971a"
colors.green_2          = "#b8bb26"
colors.yellow_1         = "#d79921"
colors.yellow_2         = "#fabd2f"
colors.blue_1           = "#458588"
colors.blue_2           = "#83a598"
colors.purple_1         = "#b16286"
colors.purple_2         = "#d3869b"
colors.aqua_1           = "#689d6a"
colors.aqua_2           = "#8ec07c"
colors.white_1          = "#a89984"
colors.white_2          = "#ebdbb2"
colors.orange_1         = "#d65d0e"
colors.orange_2         = "#fe8019"

colors.bw_0_h           = "#1d2021"
colors.bw_0             = "#282828"
colors.bw_0_s           = "#32302f"
colors.bw_1             = "#3c3836"
colors.bw_2             = "#504945"
colors.bw_3             = "#665c54"
colors.bw_4             = "#7c6f64"
colors.bw_5             = "#928374"
colors.bw_6             = "#a89984"
colors.bw_7             = "#bdae93"
colors.bw_8             = "#d5c4a1"
colors.bw_9             = "#ebdbb2"
colors.bw_10            = "#fbf1c7"
colors.transparent      = "#00000000"

--colors = t_util.set_colors(colors)


local theme = {}

theme.font          = "sans " .. dpi(19)

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#cc241d"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_normal = "#1A2A2F"
--theme.border_focus  = theme.border_normal
theme.border_focus  = "#458588"
--theme.border_focus  = "#444444"
theme.border_marked = "#91231c"

-- theme colors

theme.plan_font = theme.fg_normal
theme.plan_bg = "#222222"
theme.plan_dark1 = "#451F2B"
theme.plan_dark2 = "#441F45"
theme.plan_pale1 = "#664267"
theme.plan_pale2 = "#453845"
theme.plan_highlight = "#AA4747"

-- panel

theme.panel_height = dpi(40)
theme.panel_text_separation = dpi(16)
theme.tray_magin = dpi(2)

-- tasklist

theme.tasklist_bg_normal = theme.plan_pale2
theme.tasklist_bg_focus = theme.plan_highlight
theme.tasklist_bg_minimize = colors.transparent
theme.tasklist_width = dpi(50)
theme.tasklist_line_height = dpi(4)
theme.tasklist_spacing = dpi(8)

-- taglist

theme.taglist_bg = colors.transparent
theme.taglist_bg_focus = theme.plan_highlight
theme.taglist_group_separation = theme.panel_text_separation

-- taglist square

theme.taglist_squares_color = "#cccccc"
local taglist_square_size = dpi(7)
theme.taglist_squares_resize = true

theme.taglist_squares_sel   = surface.load_from_shape(
    taglist_square_size, taglist_square_size,
    shape.rounded_rect,
    theme.taglist_squares_color
)

theme.taglist_squares_unsel = surface.load_from_shape(
    taglist_square_size, taglist_square_size,
    shape.arc, theme.taglist_squares_color, colors.transparent, dpi(1), 0, 2*math.pi, false, false
)


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
--theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    --taglist_square_size, theme.fg_normal
--)
--theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    --taglist_square_size, theme.fg_normal
--)


-- Taglist colors

--theme.taglist_bgcolor_middle = "#0066ff88"
--theme.taglist_bgcolor_middle = "#A8194544"

--theme.taglist_bgcolors = {
    --"#00000000",
    --"#00000000",
    --"#00000000",
    --theme.taglist_bgcolor_middle,
    --theme.taglist_bgcolor_middle,
    --theme.taglist_bgcolor_middle,
    --"#00000000",
    --"#00000000",
    --"#00000000",
--}

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_bg           = theme.bg_normal
--theme.notification_border_color = colors.bw_2
theme.notification_border_color = colors.orange_1
theme.notification_border_width = 2
theme.notification_icon_size    = 80
theme.notification_opacity      = 1
theme.notification_max_width    = 710
theme.notification_max_height   = 400
theme.notification_margin       = 20

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

-- titlebar vars
theme.titlebar_height = 24
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus  = theme.bg_normal


--theme.wallpaper = themes_path.."default/background.png"
theme.wallpaper = "~/.config/awesome/min16x16.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
