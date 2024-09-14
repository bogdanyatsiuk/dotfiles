return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lua",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                }
            },
        },
    },
    config = function()
        local cmp = require "cmp"
        local ls = require "luasnip"
        local icons = require "user.helpers.icons"

        -- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
        vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

        cmp.setup {
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = "rounded",
                    -- scrollbar = false,
                },
                documentation = {
                    border = "rounded",
                },
            },
            formatting = {
                fields = { "kind", "abbr" },
                format = function(entry, vim_item)
                    vim_item.kind = icons.kind[vim_item.kind]
                    -- vim_item.menu = ({
                    --     nvim_lsp = "",
                    --     nvim_lua = "",
                    --     luasnip = "",
                    --     buffer = "",
                    --     path = "",
                    --     emoji = "",
                    -- })[entry.source.name]

                    if entry.source.name == "emoji" then
                        vim_item.kind = icons.misc.Smiley
                        vim_item.kind_hl_group = "CmpItemKindEmoji"
                    end

                    if entry.source.name == "cmp_tabnine" then
                        vim_item.kind = icons.misc.Robot
                        -- vim_item.kind_hl_group = "CmpItemKindTabnine"
                    end

                    return vim_item
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
                ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-y>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif ls.jumpable(-1) then
                        ls.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ['<C-l>'] = cmp.mapping(function()
                    if ls.expand_or_locally_jumpable() then
                        ls.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if ls.locally_jumpable(-1) then
                        ls.jump(-1)
                    end
                end, { 'i', 's' }),
                ['<C-g>'] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
                -- { name = "emoji" },
                -- { name = 'cmp_tabnine' },
                -- { name = 'cody' },
                -- { name = "codeium" },
                -- { supermaven }
            }
        }
    end,
}
