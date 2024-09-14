local key = require("user.helpers.keymap_funcs")

key.nmap('zR', '<cmd>lua require("ufo").openAllFolds()<cr>')
key.nmap('zM', '<cmd>lua require("ufo").closeAllFolds()<cr>')
key.nmap('zr', '<cmd>lua require("ufo").openFoldsExceptKinds()<cr>')
key.nmap('zm', '<cmd>lua require("ufo").closeFoldsWith()<cr>') -- closeAllFolds == closeFoldsWith(0)
key.nmap('K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require "statuscol.builtin"
                local cfg = {
                    setopt = true,
                    relculright = true,
                    segments = {

                        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },

                        { text = { "%s" }, click = "v:lua.ScSa" },
                        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                    },
                }

                require("statuscol").setup(cfg)
            end,
        }
    },
    event = "VeryLazy",
    config = function()
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, {chunkText, hlGroup})
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, {suffix, 'MoreMsg'})
            return newVirtText
        end

        require('ufo').setup({
            fold_virt_text_handler = handler
        })
    end,
}
