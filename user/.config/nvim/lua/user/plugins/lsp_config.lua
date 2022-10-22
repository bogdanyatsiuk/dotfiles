-- LSP config

local lsp_installer = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end


local function on_att()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, {buffer=0})
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {buffer=0})
--  telescope_mapper("<space>ca", "lsp_code_actions", nil, true)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
--
--  buf_nnoremap { "gT", vim.lsp.buf.type_definition }
--
--  buf_nnoremap { "<space>lr", "<cmd>lua R('tj.lsp.codelens').run()<CR>" }
--  buf_nnoremap { "<space>rr", "LspRestart" }
--
--  telescope_mapper("gr", "lsp_references", nil, true)
--  telescope_mapper("gI", "lsp_implementations", nil, true)
--  telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
--  telescope_mapper("<space>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    -- local opts = {}
	local opts = {
		on_attach = on_att,
        capabilities = cmp_nvim_lsp.default_capabilities()
		-- on_attach = require("user.lsp.handlers").on_attach,
		-- capabilities = require("user.lsp.handlers").capabilities,
	}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
