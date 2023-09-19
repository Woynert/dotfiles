

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
-- xresources.set_dpi(102)
-- xresources.set_dpi()
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

local theme = {}

local font_size = 15
local titlebar_font_size = 12
local font_name = "Hack Nerd Font Mono"

theme.font          = font_name .. " " .. dpi(font_size)

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#cc241d"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal
theme.systray_icon_spacing = dpi(8)

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(2)
theme.border_normal = colors.bw_2
--theme.border_focus  = theme.border_normal
theme.border_focus  = colors.blue_1
--theme.border_focus  = "#444444"
theme.border_marked = "#91231c"
theme.transparent   = "#00000000"

-- theme colors

theme.plan_font = theme.fg_normal
theme.plan_bg = "#222222"
theme.plan_dark1 = "#451F2B"
theme.plan_dark2 = "#441F45"
theme.plan_pale1 = "#664267"
theme.plan_pale2 = "#453845"
theme.plan_highlight = colors.blue_1
--theme.plan_highlight = "#AA4747"
theme.screen_bg = colors.blue_2

-- panel / wibar

theme.panel_bg = colors.bw_0_h
theme.panel_height = dpi(30)
theme.panel_text_separation = dpi(16)
theme.tray_margin = dpi(4)

-- tasklist

theme.tasklist_bg_normal = theme.plan_pale2
theme.tasklist_bg_focus = theme.plan_highlight
theme.tasklist_bg_minimize = theme.transparent
theme.tasklist_width = dpi(55)
theme.tasklist_line_height = dpi(3)
theme.tasklist_spacing = dpi(8)
theme.tasklist_fallback_icon = theme_dir .. "images/fallback-icon.svg"

-- taglist

theme.taglist_button_width = dpi(30)
theme.taglist_group_separation = dpi(25)
theme.taglist_bg = theme.transparent
theme.taglist_bg_focus = theme.plan_highlight

-- taglist square

theme.taglist_spacing = dpi(2)
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
    shape.arc, theme.taglist_squares_color, theme.transparent, dpi(1), 0, 2*math.pi, false, false
)

-- notifications

theme.notification_bg           = theme.bg_normal
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

theme.titlebar_font = font_name .. " " .. dpi(titlebar_font_size)
theme.titlebar_close_button_bg = colors.bw_1
theme.titlebar_close_button_width = dpi(50)
theme.titlebar_button_width = dpi(25)

theme.titlebar_icon_spacing = dpi(6)
theme.titlebar_padding = dpi(4)
theme.titlebar_height = dpi(font_size) + theme.titlebar_padding * 2 + dpi(7)
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus  = theme.bg_normal

--theme.wallpaper = themes_path.."default/background.png"
theme.wallpaper = theme_dir .. "images/min16x16.png"
--theme.wallpaper = "/data/biblioteca/pictures/Wallpapers/plain/1920x1080_bay_leaf_square.png"

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
