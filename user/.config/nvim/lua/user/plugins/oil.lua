local key = require("user.helpers.keymap_funcs")

key.nmap("-", "<cmd>lua require('oil').open_float()<CR>", { desc = "Oil: Open parent directory" })

return {
    {
        'stevearc/oil.nvim',
        lazy = true,
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = function()
            require("oil").setup({
                default_file_explorer = false,
                delete_to_trash = true,
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = "false",
                    ["<C-v>"] = "actions.select_vsplit",
                    ["<C-h>"] = "false",
                    ["<C-x>"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["q"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",

                    ["T"] = {
                        desc = "Toggle file detail view",
                        callback = function()
                            detail = not detail
                            if detail then
                                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                            else
                                require("oil").set_columns({ "icon" })
                            end
                        end,
                    },
                },
                float = {
                    padding = 4,
                    max_width = 100,
                    max_height = 40,
                },
            })
        end,
    }
}
