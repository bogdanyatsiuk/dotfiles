local key = require("user.helpers.keymap_funcs")

local servers = {
    clangd = {
        ensure_installed = true,
    },
    -- clojure_lsp = {},
    -- elixirls = {},
    gopls = {
        ensure_installed = true,
    },
    -- hls = {},
    lua_ls = {
        ensure_installed = true,
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                return
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            })
        end,
        settings = {
            Lua = {}
        },
    },
    -- marksman = {
    --     ensure_installed = true,
    -- },
    -- mojo = {},
    -- ocamllsp = {}
    -- pyright = {},
    rust_analyzer = {
        ensure_installed = true,
        settings = {
            -- diagnostics = {
            --     enable = false,
            -- },
            --     imports = {
            --         granularity = {
            --             group = "module",
            --         },
            --         prefix = "self",
            --     },
            --     cargo = {
            --         buildScripts = {
            --             enable = true,
            --         },
            --     },
            --     procMacro = {
            --         enable = true
            --     },
        },
    },
    -- solidity_ls_nomicfoundation = {},
    sourcekit = {
        filetypes = { "swift" }, -- , "objective-c", "objective-cpp" },
        -- root_dir = util.root_pattern('Package.swift', 'buildServer.json', 'compile_commands.json', '.git'),
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        },
    },
    -- tsserver = {},
}

local lsp = {}

lsp.on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        key.nmap(keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    -- nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    -- nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "[G]oto [D]eclaration")
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    -- nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    -- nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Go To Type [D]efinition")
    -- nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    -- nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("gl", vim.diagnostic.open_float, "Open Diagnostic")

    -- nmap("K", vim.lsp.buf.hover, "")
    nmap("gK", vim.lsp.buf.signature_help, "Signature Help")

    -- nmap("<leader>ls", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[L]ist Workspace [S]ymbols")
    nmap("<leader>cwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[C]ode [W]orkspace [L]ist folders")
    nmap("<leader>cwa", vim.lsp.buf.add_workspace_folder, "[C]ode [W]orkspace [A]dd folder")
    nmap("<leader>cwr", vim.lsp.buf.remove_workspace_folder, "[C]ode [W]orkspace [R]emove folder")

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("<leader>ci", vim.lsp.buf.incoming_calls, "Show [C]alls [I]ncoming")
    nmap("<leader>co", vim.lsp.buf.outgoing_calls, "Show [C]alls [O]utgoing")

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local highlight_augroup = vim.api.nvim_create_augroup('aug-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('aug-lsp-detach', { clear = true }),
            callback = function(event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'aug-lsp-highlight', buffer = event.buf }
            end,
        })
    end

    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        nmap('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
        end, '[T]oggle Inlay [H]ints')
    end

    -- require("nvim-navbuddy").attach(client, bufnr)
end

lsp.capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    return vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
end

lsp.ensure_installed = function()
    local toinstall = {}
    local i = 1
    for k, v in pairs(servers) do
        if v.ensure_installed then
            toinstall[i] = k
            i = i + 1
        end
    end
    -- vim.list_extend(toinstall, {
    --     'stylua', -- Used to format Lua code
    -- })
    -- print("ensure installed: " .. vim.inspect(toinstall))
    return toinstall
end

lsp.externally_installed = function()
    local toinstall = {}
    local i = 1
    for k, v in pairs(servers) do
        if not v.ensure_installed then
            toinstall[i] = k
            i = i + 1
        end
    end
    return toinstall
end

return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        -- event = "VeryLazy",
        dependencies = {
            {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                { "antosha417/nvim-lsp-file-operations", config = true },
                -- {
                --     "SmiteshP/nvim-navbuddy",
                --     dependencies = {
                --         "SmiteshP/nvim-navic",
                --         "MunifTanjim/nui.nvim"
                --     },
                --     opts = { lsp = { auto_attach = true } }
                -- },
            }
        },

        config = function()
            local lspconfig = require "lspconfig"

            local function setup_server(name)
                local server = servers[name] or {}
                server.capabilities = vim.tbl_deep_extend('force', lsp.capabilities(), server.capabilities or {})
                server.on_attach = lsp.on_attach
                lspconfig[name].setup(server)
            end

            require('mason').setup({ ui = { border = "rounded" }})
            require('mason-lspconfig').setup({
                ensure_installed = lsp.ensure_installed(),
                handlers = {
                    function(server_name)
                        setup_server(server_name)
                    end,
                },
            })

            -- Additional servers
            for _, server_name in ipairs(lsp.externally_installed()) do
                setup_server(server_name)
            end

            -- require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            local icons = require("user.helpers.icons")
            local signs = {
                Error = icons.diagnostics.BoldError,
                Warn  = icons.diagnostics.BoldWarning,
                Hint  = icons.diagnostics.BoldHint,
                Info  = icons.diagnostics.BoldInformation,
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
            end
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            integration = {
                ["nvim-tree"] = {
                    enable = false,
                },
            },
        },
        event = "VeryLazy",
    },
}
