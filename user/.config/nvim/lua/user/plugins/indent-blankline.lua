return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
        debounce = 100,
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = { enabled = false },
        -- scope = {
        --             show_start = false,
        --             show_end = false,
        --             show_exact_scope = true,
        --         },
        exclude = {
            filetypes = {
                "Trouble",
                "alpha",
                "dashboard",
                "help",
                "lazy",
                "lazyterm",
                "lspinfo",
                "mason",
                "neo-tree",
                "noice",
                "notify",
                "nvimtree",
                "oil",
                "oil_preview",
                "toggleterm",
                "trouble",
            },
        },
    },
    main = "ibl",
}
