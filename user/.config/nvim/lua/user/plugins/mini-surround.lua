return {
    'echasnovski/mini.surround',
    version = false,
    event = "VeryLazy",
    config = function()
        require('mini.surround').setup({
            mappings = {
                add = '<Leader>sa', -- Add surrounding in Normal and Visual modes
                delete = '<Leader>sd', -- Delete surrounding
                find = '<Leader>sf', -- Find surrounding (to the right)
                find_left = '<Leader>sF', -- Find surrounding (to the left)
                highlight = '<Leader>sh', -- Highlight surrounding
                replace = '<Leader>sr', -- Replace surrounding
                update_n_lines = '<Leader>sn', -- Update `n_lines`
            },
        })
    end,
}
