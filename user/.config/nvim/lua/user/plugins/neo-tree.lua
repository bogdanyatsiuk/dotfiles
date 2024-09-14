local key = require("user.helpers.keymap_funcs")

key.nmap("<Leader>e", ":Neotree toggle<CR>")
key.nmap("<Leader>i", ":Neotree reveal<CR>")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
}
