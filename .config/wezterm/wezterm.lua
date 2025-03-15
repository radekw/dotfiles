-- vim: tabstop=2 shiftwidth=2 expandtab

local wezterm = require("wezterm")

local config = wezterm.config_builder()
local projects = require 'projects'

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 16

config.window_close_confirmation = "NeverPrompt"
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.status_update_interval = 1000

local function segments_for_right_status(window)
    return {
        window:active_workspace(),
        wezterm.strftime('%a %b %-d %H:%M'),
        wezterm.hostname(),
    }
end

wezterm.on('update-status', function(window, _)
    local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
    local segments = segments_for_right_status(window)

    local color_scheme = window:effective_config().resolved_palette
    -- Note the use of wezterm.color.parse here, this returns
    -- a Color object, which comes with functionality for lightening
    -- or darkening the colour (amongst other things).
    local bg = wezterm.color.parse(color_scheme.background)
    local fg = color_scheme.foreground

    -- Each powerline segment is going to be coloured progressively
    -- darker/lighter depending on whether we're on a dark/light colour
    -- scheme. Let's establish the "from" and "to" bounds of our gradient.
    local gradient_to, gradient_from = bg, bg
    gradient_from = gradient_to:lighten(0.2)

    -- Yes, WezTerm supports creating gradients, because why not?! Although
    -- they'd usually be used for setting high fidelity gradients on your terminal's
    -- background, we'll use them here to give us a sample of the powerline segment
    -- colours we need.
    local gradient = wezterm.color.gradient(
        {
            orientation = 'Horizontal',
            colors = { gradient_from, gradient_to },
        },
        #segments -- only gives us as many colours as we have segments.
    )

    -- We'll build up the elements to send to wezterm.format in this table.
    local elements = {}

    for i, seg in ipairs(segments) do
        local is_first = i == 1

        if is_first then
            table.insert(elements, { Background = { Color = 'none' } })
        end
        table.insert(elements, { Foreground = { Color = gradient[i] } })
        table.insert(elements, { Text = SOLID_LEFT_ARROW })

        table.insert(elements, { Foreground = { Color = fg } })
        table.insert(elements, { Background = { Color = gradient[i] } })
        table.insert(elements, { Text = ' ' .. seg .. ' ' })
    end

    window:set_right_status(wezterm.format(elements))
end)

config.leader = { key = 'i', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    {
        key = 't',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.SpawnWindow,
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelativeNoWrap(-1),
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelativeNoWrap(1),
    },
    {
        key = 'p',
        mods = 'LEADER',
        -- Present in to our project picker
        action = projects.choose_project(),
    },
    {
        key = 'f',
        mods = 'LEADER',
        -- Present a list of existing workspaces
        action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
    },
}

return config
