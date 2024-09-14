return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'clojure',
            'cmake',
            'cpp',
            'css',
            'csv',
            'diff',
            'dockerfile',
            'elixir',
            'go',
            'haskell',
            'html',
            'javascript',
            'jq',
            'jsdoc',
            'json',
            'lua',
            'luadoc',
            'make',
            'markdown',
            'markdown_inline',
            'nasm',
            'ocaml',
            'python',
            'query',
            'rust',
            'solidity',
            'sql',
            'swift',
            'tmux',
            'toml',
            'typescript',
            'vim',
            'vimdoc',
            'xml',
            'yaml',
        },
        sync_install = false,
        auto_install = false,
        highlight = {
            enable = true,
            -- disable = { "c", "rust" },
            -- additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = {
            enable = true,
            -- disable = { 'ruby' }
        },

        additional_vim_regex_highlighting = false,
    },
    config = function(_, opts)
    --     ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
}
