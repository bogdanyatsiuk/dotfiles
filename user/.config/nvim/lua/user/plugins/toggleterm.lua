function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<C-h>', [[<Cmd>TmuxNavigateLeft<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>TmuxNavigateDown<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>TmuxNavigateUp<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>TmuxNavigateRight<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

return {
    'akinsho/toggleterm.nvim',
    event = "VeryLazy",
    version = "*",
    config = function()
        require('toggleterm').setup({
            size = function(term)
                if term.direction == 'horizontal' then
                    return 25
                elseif term.direction == 'vertical' then
                    return math.floor(vim.o.columns * 0.4)
                end
            end,
            open_mapping = [[<c-t>]],
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode
            persist_mode = false,
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 4,
            },
            winbar = {
                enabled = true,
                name_formatter = function(term) --  term: Terminal
                    local id = term.name:match("#[%d+]$")
                    if id == nil or id == '' then
                        return term.name
                    end
                    return "[ " .. id .. " ]"
                end
            },
        })
    end,
}


