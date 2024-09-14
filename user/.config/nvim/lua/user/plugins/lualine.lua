return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- event = "UiEnter",
    -- event = "VeryLazy",
    config = function()
        local outline_ext = {
            sections = {
                lualine_a = { 'filetype' },
                lualine_z = { 'location' },
            },
            filetypes = { 'Outline' }
        }
        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end
        require("lualine").setup {
            options = {
                theme = 'auto', -- 'tokyonight'
            },
            sections = {
                lualine_b = {
                    {
                        'branch',
                        icon = { '' },
                    },
                    'diff',
                    'diagnostics',
                },
                lualine_c = {
                    'filename',
                    {
                        "macro-recording",
                        fmt = show_macro_recording,
                    },
                }
            },
            extensions = {
                -- 'fugitive',
                -- 'fzf',
                'lazy',
                'mason',
                -- 'neo-tree',
                -- 'nvim-dap-ui',
                'nvim-tree',
                'oil',
                -- 'overseer',
                'quickfix',
                -- 'toggleterm',
                -- 'trouble',
                outline_ext,
            }
        }
    end,
}
