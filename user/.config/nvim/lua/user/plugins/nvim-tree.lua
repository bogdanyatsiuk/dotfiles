local function is_arg_dir()
    return vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1
end

local function load_keys()
    if is_arg_dir() then return nil else return { "<Leader>e", "<Leader>i" } end
end

local function load_cmd()
    if is_arg_dir() then return nil else return { "NvimTreeToggle", "NvimTreeFindFile" } end
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
    cmd = load_cmd(),
    keys = load_keys(),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local key = require("user.helpers.keymap_funcs")
        key.nmap("<Leader>e", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
        key.nmap("<Leader>i", ":NvimTreeFindFile<CR>", { desc = "NvimTree Inspect File" })

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
