-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- neodev
        -- indentline
        -- 'folke/lazydev.nvim'
        --  'Bilal2453/luvit-meta', lazy = true },
        -- Color scheme
        require 'user.plugins.colorscheme',

        -- Status line
        require 'user.plugins.lualine',

        -- Navigation
        require 'user.plugins.nvim-tree',
        -- require 'user.plugins.neo-tree',
        require 'user.plugins.oil',
        require 'user.plugins.telescope',
        require 'user.plugins.harpoon',
        -- folke/flash.nvim
        -- echasnovski/mini.jump2d
        require 'user.plugins.tmux-navigator',

        -- LSP & Syntax
        require 'user.plugins.treesitter',
        require 'user.plugins.lsp-config',
        require 'user.plugins.completions',
        -- folke/trouble.nvim
        -- mason :
        --    clangd - c/c++
        --    rust-analyzer
        --    gopls
        --    python-lsp-server
        --    sourcekit - swift
        --    typescript
        -- S   lua
        ----
        --    db
        --    wasm
        --    solidity
        --    mojo
        --    haskell
        --    elixir
        --    closure
        --    ocaml


        -- Formatters & Linters

        -- Debug
        -- nvim-dap
        -- nvim-dap-ui
        -- vimspector

        -- Build / Run / Eval / Test

        -- Editor (UI)
        require 'user.plugins.indent-blankline',
        require 'user.plugins.mini-indentscope',
        require 'user.plugins.aerial',
        require 'user.plugins.outline',
        require 'user.plugins.ufo',

        -- Editing
        require 'user.plugins.comments',
        require 'user.plugins.autopairs',
        require 'user.plugins.colorizer',
        require 'user.plugins.todo-comments',
        require 'user.plugins.mini-ai',
        require 'user.plugins.mini-surround',
        -- Wansmer/treesj

        -- Git
        require 'user.plugins.gitsigns',
        require 'user.plugins.neogit',

        -- UI
        require 'user.plugins.noice',
            -- barbecue.nvim

        -- Notes
        -- markdown
        -- preview
        -- obsidian
        -- focus

        -- AI

        -- Extras
        require 'user.plugins.which-key',
        -- goolord/alpha-nvim or nvimdev/dashboard-nvim
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
