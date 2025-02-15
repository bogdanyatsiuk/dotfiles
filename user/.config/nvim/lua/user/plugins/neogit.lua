return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
    },
    opts = {
        -- graph_style = "kitty",
        graph_style = "unicode",
    },
    event = "VeryLazy",
    config = true,
}
