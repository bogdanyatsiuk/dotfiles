local key = require("user.helpers.keymap_funcs")

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>ma", "<leader>0", "<leader>1", "<leader>2", "<leader>3", "<leader>4" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        key.nmap("<leader>ma", function() harpoon:list():add() end, { desc = "Harpoon: add file" })
        key.nmap("<leader>0", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: toggle quick menu" })

        key.nmap("<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: navigate to file 1" })
        key.nmap("<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: navigate to file 2" })
        key.nmap("<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: navigate to file 3" })
        key.nmap("<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: navigate to file 4" })

        -- key.nmap("<leader>,", function() harpoon:list():prev() end, { desc = "Harpoon: navigate to previous file" })
        -- key.nmap("<leader>.", function() harpoon:list():next() end, { desc = "Harpoon: navigate to next file" })

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })

                key.nmap("1", function() harpoon:list():select(1) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 1" })
                key.nmap("2", function() harpoon:list():select(2) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 2" })
                key.nmap("3", function() harpoon:list():select(3) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 3" })
                key.nmap("4", function() harpoon:list():select(4) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 4" })
                key.nmap("5", function() harpoon:list():select(5) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 5" })
                key.nmap("6", function() harpoon:list():select(6) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 6" })
                key.nmap("7", function() harpoon:list():select(7) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 7" })
                key.nmap("8", function() harpoon:list():select(8) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 8" })
                key.nmap("9", function() harpoon:list():select(9) end, { buffer = cx.bufnr, desc = "Harpoon: navigate to file 9" })
            end,
        })
    end
}
