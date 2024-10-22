return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            -- Load the colorscheme here.
            -- tokyonight-night
            -- tokyonight-storm
            -- tokyonight-day
            -- tokyonight-moon
            vim.cmd.colorscheme 'tokyonight-moon'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
        opts = {
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        event = "VeryLazy",
        -- priority = 1000,
        -- config = function()
        --     require("catppuccin").setup({
        --     })
        --     vim.cmd.colorscheme "catppuccin"
        -- end
        opt = {
            integrations = {
                aerial = true,
                alpha = true,
                gitsigns = true,
                harpoon = true,
                mason = true,
                mini = {
                    enabled = true,
                    indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                },
                neotree = true,
                neogit = true,
                neotest = true,
                noice = true,
            }
        }
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = true,
        event = "VeryLazy",
        -- priority = 1000,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        event = "VeryLazy",
        -- priority = 1000,
    },
}
