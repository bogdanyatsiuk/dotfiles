return {
  'stevearc/aerial.nvim',
    lazy = true,
    cmd = { "AerialNavOpen", "AerialNavToggle" },
    keys = { -- Example mapping to toggle aerial
        { "<leader>O", "<cmd>AerialNavToggle<CR>", desc = "Toggle Aerial" },
    },
  opts = {},
}
