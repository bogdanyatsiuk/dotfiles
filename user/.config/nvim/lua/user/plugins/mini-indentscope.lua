return {
    "echasnovski/mini.indentscope",
    version = false,
    event = "VeryLazy",
    opts = {
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 70,
        },
        symbol = "│",
        options = {
            border = 'top',
            try_as_border = true
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
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
                "toggleterm",
                "trouble",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
