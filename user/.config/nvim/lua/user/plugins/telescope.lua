return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        lazy = true,
        config = function()
            local actions = require("telescope.actions")
            require('telescope').setup({
                defaults = {
                    prompt_prefix = "❯ ",
                    selection_caret = "▶︎ ",
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
                }
            })
            require('telescope').load_extension("fzf")
            require('telescope').load_extension("repo")
        end,
    },

    {
        'cljoly/telescope-repo.nvim',
        lazy = true,
    },

    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        config = function()
            require('neoclip').setup({
                preview = false
            })
        end,
    },
    -- "benfowler/telescope-luasnip.nvim"
}
