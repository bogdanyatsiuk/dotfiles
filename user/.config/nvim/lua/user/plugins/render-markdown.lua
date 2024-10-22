return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
        enabled = true,
        render_modes = { 'n', 'v', 'i', 'c' },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    cmd = { "RenderMarkdown" },
    ft = { "markdown" },
    keys = {
        { "<leader>mr", "<cmd>RenderMarkdown enable<cr>" },
        { "<leader>mR", "<cmd>RenderMarkdown disable<cr>" },
        { "<leader>mm", "<cmd>RenderMarkdown toggle<cr>" },
    },
}
