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
        require 'user.plugins.trouble',
        require 'user.plugins.xcodebulid',
        -- utilyre/barbecue.nvim
        -- Bekaboo/dropbar.nvim
        -- nvim-treesitter/nvim-treesitter-context

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

        -- folke/snacks.nvim

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
        -- akinsho/git-conflict.nvim
        -- f-person/git-blame.nvim
        -- moyiz/git-dev.nvim
        -- niuiic/git-log.nvim

        -- UI
        require 'user.plugins.noice',
        -- stevearc/dressing.nvim
            -- barbecue.nvim

        -- Notes
        require 'user.plugins.render-markdown',
        require 'user.plugins.markdown-preview',
        -- require 'user.plugins.markdown',
        -- bullets-vim/bullets.vim
        -- tadmccorkle/markdown.nvim
        -- roodolv/markdown-toggle.nvim
        -- antonk52/markdowny.nvim
        -- epwalsh/obsidian.nvim
        -- require 'user.plugins.image',
        -- mason: markdown-cli2 / markdown-toc / marksman
        -- vale cli
        -- For inspiration

        -- stevearc/overseer.nvim

        -- AI
        -- yetone/avante.nvim
        -- gen.nvim
        -- copilop.vim
        -- copilot-cmp
        -- codium
        -- tabnine
        -- minuet-ai.nvim
        -- copitol-chat.nvim
        -- gp.nvim

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
        -- folke/twilight.nvim
        -- windwp/windline.nvim
        -- akinsho/git-conflict.nvim
        -- wojciech-kulik/xcodebuild.nvim
        -- kawre/leetcode.nvim
        -- nvim-pack/nvim-spectre
        -- ahmedkhalf/project.nvim

        -- Usless
        -- https://github.com/Eandrju/cellular-automaton.nvim
        -- https://github.com/tamton-aquib/duck.nvim
        -- https://github.com/rhysd/vim-syntax-christmas-tree
        -- https://github.com/AndrewRadev/dealwithit.vim
        -- https://github.com/folke/drop.nvim
        -- https://github.com/tamton-aquib/zone.nvim
        -- https://github.com/letieu/hacker.nvim
        -- https://github.com/NStefan002/donut.nvim
        -- https://github.com/blumaa/octopus.nvim
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

-- TODO:
-- - [ ] Markdown
--     - [ ] Editing / Toggling
--     - [ ] Preview in browser
--     - [ ] spell
--     - [ ] Images
--     - [ ] LSP
-- - [ ] Git
--     - [ ] Conflicts
--     - [ ] Log selected file
-- - [ ] Context line
-- - [ ] LSP and Tools
--     - [ ] Rust
--     - [ ] Go
--     - [ ] Python
--     - [ ] Swift
-- - [ ] DAP
-- - [ ] Formatters and linters
-- - [ ] Other languages support
-- - [ ] AI
-- - [ ] Additional plugins
