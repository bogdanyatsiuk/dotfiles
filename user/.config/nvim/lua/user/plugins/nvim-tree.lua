local key = require("user.helpers.keymap_funcs")

key.nmap("<Leader>e", ":NvimTreeToggle<CR>")
-- nmap("<Leader>R", ":NvimTreeRefresh<CR>")
key.nmap("<Leader>i", ":NvimTreeFindFile<CR>")

local function load_event()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
        return nil
    else
        return "VeryLazy"
    end
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
    --
  vim.keymap.del('n', '<C-k>', { buffer = bufnr })
  vim.keymap.set('n', '<C-S>', api.node.show_info_popup, opts('Show Info'))
  vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
    "nvim-tree/nvim-tree.lua",
    event = load_event(),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            renderer = {
                indent_markers = {
                    enable = true
                }
          },
          diagnostics = {
              enable = true,
              show_on_dirs = true,
              show_on_open_dirs = true,
              severity = {
                  min = vim.diagnostic.severity.WARN,
                  max = vim.diagnostic.severity.ERROR,
              }
          },
          on_attach = my_on_attach,
      }
    end,
}
