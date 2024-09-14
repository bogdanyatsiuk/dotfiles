local builtin = require("telescope.builtin")
local utils = require("telescope.utils")
local actions = require("telescope.actions")

local M = {}

function M.search_current_buffer()
    builtin.current_buffer_fuzzy_find(
        {
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            }
        }
    )
end

function M.search_files()
    local _, ret, stderr = utils.get_os_command_output {
        "git",
        "rev-parse",
        "--is-inside-work-tree",
    }

    if ret == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end

function M.neoclip()
    require('telescope').extensions.neoclip.default(
        {
            initial_mode = "normal",
            sorting_strategy = "ascending",
            layout_strategy = 'vertical',
            layout_config = {
                prompt_position = "top",
            }
        }
    )
end

function M.macros()
    require('telescope').extensions.macroscope.default(
        {
            initial_mode = "normal",
            sorting_strategy = "ascending",
            layout_strategy = 'vertical',
            layout_config = {
                prompt_position = "top",
            }
        }
    )
end

return M
