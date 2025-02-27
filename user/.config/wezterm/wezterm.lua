-- Pull in the wezterm API
local wezterm = require 'wezterm'
local k = require("utils/keymap")

-- To have proper displaying for images inside of neovim, need to install kitty term info
-- tempfile=$(mktemp) && curl -o "$tempfile" https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo && tic -x -o ~/.terminfo "$tempfile" && rm "$tempfile"
-- and set default term to kitty
-- term = "xterm-kitty"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Spawn a zsh shell in login mode and launch tmux
config.default_prog = { 'zsh', '-l', '-c', 'tmux attach-session || tmux new -s main' }

-- Changing the color scheme:
-- config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Ayu Mirage (Gogh)'
-- config.color_scheme = 'Banana Blueberry'
-- config.color_scheme = 'Campbell (Gogh)'

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
  left = '0.7cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

config.font = wezterm.font 'MesloLGM Nerd Font'
config.font_size = 14.5

config.default_cursor_style = 'SteadyBar'
-- config.cursor_thickness = '200%'
config.cursor_thickness = '1.5pt'

config.keys = {
    k.cmd_to_tmux_key("1", "1"), -- navigate to window (1-9)
    k.cmd_to_tmux_key("2", "2"),
    k.cmd_to_tmux_key("3", "3"),
    k.cmd_to_tmux_key("4", "4"),
    k.cmd_to_tmux_key("5", "5"),
    k.cmd_to_tmux_key("6", "6"),
    k.cmd_to_tmux_key("7", "7"),
    k.cmd_to_tmux_key("8", "8"),
    k.cmd_to_tmux_key("9", "9"),
    k.cmd_to_tmux_key("n", "n"), -- new windbw
    k.cmd_to_tmux_key(",", ","), -- prev window
    k.cmd_to_tmux_key(".", "."), -- next window
    k.cmd_to_tmux_key("h", "|"), -- split horizotally
    k.cmd_to_tmux_key("y", "_"), -- split vertically
    k.cmd_to_tmux_key("z", "z"), -- zoom pane
    k.cmd_to_tmux_key("0", "E"), -- equally resize panes
    k.cmd_to_tmux_key("g", "g"), -- lazygit
    k.cmd_to_tmux_key("t", "T"), -- open session switcher
    k.cmd_to_tmux_key("j", "s"), -- show sessions
    k.cmd_to_tmux_key("k", "["), -- enter tmux copy mode
    k.cmd_to_tmux_key("]", "}"), -- swap with next pane
    k.cmd_to_tmux_key("[", "{"), -- swap with prev pane
    k.cmd_shift_to_tmux_key(":", ":"), -- enter command prompt
    k.cmd_shift_to_tmux_key("!", "!"), -- break pane
    k.cmd_shift_to_tmux_key("j", "B"), -- join pane
    k.cmd_shift_to_tmux_key("l", "L"), -- link window
    k.cmd_to_tmux_key("x", "x"), -- close pane
    k.cmd_shift_to_tmux_key("x", "X"), -- close window
    k.cmd_to_tmux_key("d", "d"), -- detach from session
    k.cmd_to_tmux_key("s", "s"), -- switch session
    k.cmd_shift_to_tmux_key("n", "N"), -- New session

    -- New wezterm window without attached tmux session
    k.ctrl_shift_key_action("n", wezterm.action.SpawnCommandInNewWindow { args = { 'zsh', '-l' } }),

    k.ctrl_to_send_string(",",  "\x1b\x2c"), -- Ctrl+, will send Opt+, to use in nvim
    k.ctrl_to_send_string(";",  "\x1b\x3b"), -- Ctrl+; will send Opt+; to use in nvim

    k.cmd_to_send_string("/", "gcc"),
}

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

-- config.debug_key_events = true

-- and finally, return the configuration to wezterm
return config
