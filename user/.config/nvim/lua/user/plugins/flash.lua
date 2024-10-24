return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      -- labels = "asdfghjklqwertyuiopzxcvbnm",
      labels = "seritnaofuc,dhplywx[bjvkq;z/",
        modes = {
            search = { -- use flash for search
                enabled = false, -- require("flash").toggle()
            },
            char = { -- use flash for f, F, t, T
                enabled = false,
            }
        },
    },
    -- stylua: ignore
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
