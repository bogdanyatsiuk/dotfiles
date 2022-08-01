-- 404452
vim.cmd [[highlight BgIndentBlanklineIndent guifg=#404452 gui=nocombine]]

require("indent_blankline").setup {
    -- char = '|'
    -- char = '▏',
    -- char = ' ',
    -- char_list = {'|', '¦', '┆', '┊'},
    -- context_char = '┃',
    -- char = '▏',
    -- context_char = '▎',
    show_current_context = true,
    -- show_current_context_start = true,
    show_first_indent_level = true,
    -- context_patterns = {
    --     "class",
    --     "return",
    --     "function",
    --     "method",
    --     "^if",
    --     "^while",
    --     "^for",
    --     "^object",
    --     "^table",
    --     "block",
    --     "arguments",
    --     "if_statement",
    --     "else_clause",
    --     "try_statement",
    --     "catch_clause",
    --     "import_statement",
    --     "operation_type",
    -- },
    filetype_exclude = {
      'help',
      'terminal',
      'dashboard',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
    },
    buftype_exclude = { 'terminal', 'NvimTree' },
    char_highlight_list = {
        "BgIndentBlanklineIndent",
    }
}
