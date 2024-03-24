-- took from https://github.com/joshmedeski/dotfiles/blob/main/.config/wezterm/utils/keys.lua

local act = require("wezterm").action
local M = {}

M.key_table = function(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

local function cmd_key(key, action)
	return M.key_table("CMD", key, action)
end

local function cmd_shift_key(key, action)
	return M.key_table("CMD|SHIFT", key, action)
end

local function tmux_pref_key(key, mods)
    return act.Multiple({
        act.SendKey({ mods = "CTRL", key = "b" }),
        act.SendKey({ mods = mods, key = key }),
    })
end


M.cmd_to_tmux_key = function(key, tmux_key, mods)
	return cmd_key(
		key,
        tmux_pref_key(tmux_key, mods)
	)
end

M.cmd_shift_to_tmux_key = function(key, tmux_key, mods)
	return cmd_shift_key(
		key,
        tmux_pref_key(tmux_key, mods)
	)
end

return M
