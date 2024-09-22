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
        -- jay-babu/mason-nvim-dap.nvim
        -- rcarriga/nvim-dap-ui
        -- theHamsta/nvim-dap-virtual-text
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
        require 'user.plugins.flash',
        require 'user.plugins.toggleterm',

        -- Editing
        require 'user.plugins.comments',
        require 'user.plugins.autopairs',
        require 'user.plugins.colorizer',
        require 'user.plugins.todo-comments',
        require 'user.plugins.mini-ai',
        require 'user.plugins.mini-surround',

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
        -- https://github.com/3rd/image.nvim
        -- focus

        -- AI
        -- yetone/avante.nvim

        -- Extras
        require 'user.plugins.which-key',
        require 'user.plugins.zen-mode'
        -- goolord/alpha-nvim or nvimdev/dashboard-nvim
        -- Wansmer/treesj
        -- rmagatti/goto-preview
        -- nvim-spectre
        -- refactoring.nvim
        -- stevearc/dressing.nvim
        -- HakonHarnes/img-clip.nvim
        -- Shatur/neovim-session-manager
        -- ahmedkhalf/project.nvim
        -- tiagovla/scope.nvim
        -- folke/trouble.nvim
        -- folke/twilight.nvim
        -- windwp/windline.nvim
        -- akinsho/git-conflict.nvim
        -- wojciech-kulik/xcodebuild.nvim
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})
