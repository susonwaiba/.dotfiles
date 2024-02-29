local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.default_prog = {"C:\\Users\\suson\\AppData\\Local\\Microsoft\\WindowsApps\\ubuntu.exe"},
-- config.default_prog = {"wsl.exe"},
-- config.default_cwd = "C:\\Users\\SOME\\PATH",
-- Or if you prefer environment variables
-- config.default_cwd = os.getenv("HOME"),

-- config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono',
config.font = wezterm.font 'CaskaydiaCove NF' -- For MacOS
if wezterm.target_triple == 'x86_64-apple-darwin' then
    config.font_size = 16.0
else
    config.font_size = 14.0
end
config.adjust_window_size_when_changing_font_size = false
config.default_cursor_style = "SteadyBlock"

-- config.color_scheme = 'Github (base16)' -- light
-- config.color_scheme = 'Github' -- light
-- config.color_scheme = 'Github Dark' -- light
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Gruber (base16)'
config.colors = {
    -- cursor_bg = '#fadd38',
    -- tab_bar = {
    --     background = '#eee',
    --     active_tab = {
    --         bg_color = '#fff',
    --         fg_color = '#666',
    --     },
    --     inactive_tab = {
    --         bg_color = '#ddd',
    --         fg_color = '#777',
    --     },
    --     inactive_tab_hover = {
    --         bg_color = '#ccc',
    --         fg_color = '#666',
    --         italic = false,
    --     },
    --     new_tab = {
    --         bg_color = '#bbb',
    --         fg_color = '#777',
    --     },
    --     new_tab_hover = {
    --         bg_color = '#999',
    --         fg_color = '#666',
    --         italic = false,
    --     },
    -- },
}

config.hide_mouse_cursor_when_typing = false

-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- config.window_background_image = "C:\\Users\\suson\\OneDrive\\Pictures\\Wallpapers\\1188592.png"
-- config.window_background_image_hsb = {
--     brightness = 0.004,
--     hue = 0.4,
--     saturation = 0.2,
-- }
config.window_background_opacity = 0.95
-- config.text_background_opacity = 0.95
config.macos_window_background_blur = 12   -- For MacOS
config.native_macos_fullscreen_mode = true -- For MacOS

config.audible_bell = "Disabled"

config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.keys = {
    {
        key = 'm',
        modes = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    }
}

wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window {}
    window:gui_window():maximize()
    -- if wezterm.target_triple == 'x86_64-apple-darwin' then
    --     window:gui_window():toggle_fullscreen()
    -- end
end)

return config
