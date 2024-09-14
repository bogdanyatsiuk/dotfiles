return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup({
            on_attach = function(buffer)
                local gs = require('gitsigns')

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- Navigation
                map("n", "]h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gs.nav_hunk("next")
                    end
                end, "Next Hunk")
                map("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gs.nav_hunk("prev")
                    end
                end, "Prev Hunk")

                -- Actions
                -- visual mode
                map('v', '<leader>hs', function()
                    gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, 'stage git hunk' )
                map('v', '<leader>hr', function()
                    gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, 'reset git hunk' )
                -- normal mode
                map('n', '<leader>hs', gs.stage_hunk, 'git [s]tage hunk')
                map('n', '<leader>hS', gs.stage_buffer, 'git [S]tage buffer')
                map('n', '<leader>hr', gs.reset_hunk, 'git [r]eset hunk')
                map('n', '<leader>hR', gs.reset_buffer, 'git [R]eset buffer')
                map('n', '<leader>hu', gs.undo_stage_hunk, 'git [u]ndo stage hunk')
                map('n', '<leader>hp', gs.preview_hunk, 'git [p]review hunk')
                map('n', '<leader>hP', gs.preview_hunk_inline, 'git [p]review hunk inline')
                map("n", "<leader>gb", gs.blame_line, "Blame Line")
                map("n", "<leader>gB", gs.blame, "Blame Buffer")
                map("n", "<leader>gd", gs.diffthis, "Diff This")
                map("n", "<leader>gD", function() gs.diffthis("@") end, "git [D]iff against last commit")
                map('n', '<leader>tb', gs.toggle_current_line_blame, '[T]oggle git show [b]lame line')
                map('n', '<leader>tD', gs.toggle_deleted, '[T]oggle git show [D]eleted')
            end,
        })
    end
}
