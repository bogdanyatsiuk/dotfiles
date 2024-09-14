local key = require("user.helpers.keymap_funcs")

-- Telescope
key.nmap("<Leader>j", "<cmd>lua require('user.helpers.telescope').search_files()<cr>")
key.nmap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
key.nmap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
key.nmap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
key.nmap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
key.nmap("<Leader>fB", "<cmd>lua require('telescope.builtin').builtin()<cr>")
key.nmap("<leader>fc", "<cmd>lua require('user.helpers.telescope').search_current_buffer()<cr>")
key.nmap("<leader>fr", "<cmd>lua require'telescope'.extensions.repo.list{}<cr>")
key.nmap("<leader>fM", "<cmd>lua require('user.helpers.telescope').open_bookmarks()<cr>", { desc = 'Fuzzy search browser bookmarks', })
key.nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = '[F]ind [H]elp', })
key.nmap("<leader>u", "<cmd>lua require('telescope').extensions.undo.undo()<cr>")

key.nmap("<leader>fM", "<cmd>lua require('telescope').extensions.bookmarks.bookmarks({})<cr>", { desc = 'Fuzzy search browser bookmarks', })
key.nmap("<leader>fy", "<cmd>lua require('user.helpers.telescope').neoclip()<cr>")
key.nmap("<leader>fm", "<cmd>lua require('user.helpers.telescope').macros()<cr>")
key.nmap("<leader>fl", "<cmd>lua require'telescope.builtin'.symbols{}<cr>")

return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-telescope/telescope-symbols.nvim' },
        },
        config = function()
            local telescope = require('telescope')
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    prompt_prefix = "❯ ",
                    selection_caret = "▶︎ ",
                    mappings = {
                        n = {
                            ["q"] = actions.close,
                        }
                    }
                },
                pickers = {
                    colorscheme = { enable_preview = true },
                },
                extensions = {
                    repo = {
                        list = {
                            fd_opts = {
                                "--no-ignore-vcs",
                            },
                            search_dirs = {
                                "~/Developer",
                            },
                        },
                    },
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {
                            layout_config = {
                                width = 0.8,
                                height = 0.8,
                            }
                        },
                        specific_opts = {
                            ['browser-bookmarks'] = {
                                make_displayer = function()
                                    local entry_display = require "telescope.pickers.entry_display"
                                    return entry_display.create {
                                        separator = ' ',
                                        items = {
                                            { width = 0.5 },
                                            { remaining = true },
                                        },
                                    }
                                end,
                                make_display = function(displayer)
                                    return function(entry)
                                        return displayer {
                                            entry.value.text.name,
                                            { entry.value.text.url, 'Comment' },
                                        }
                                    end
                                end,
                            },
                        },
                    },
                }
            })
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("repo")
            telescope.load_extension('bookmarks')
        end,
    },
    { 'cljoly/telescope-repo.nvim', lazy = true },
    {
        'dhruvmanila/browser-bookmarks.nvim',
        lazy = true,
        version = '*',
        opts = {
            -- selected_browser = 'arc',
            selected_browser = 'chrome',
            -- profile_name = 'Person 1',
            -- debug = true,
        },
    -- https://github.com/ivnvxd/arc-export/tree/main
    },
    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        config = function()
            require('neoclip').setup({
                preview = false,
                default_register = {'"', '+'},
                on_replay = {
                    move_to_front = true,
                }
            })
        end,
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.7,
                    },
                },
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
}
