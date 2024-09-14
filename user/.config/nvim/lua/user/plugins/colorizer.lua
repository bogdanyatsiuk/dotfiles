-- local key = require("user.helpers.keymap_funcs")
--
-- key.nmap("<leader>tc", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer" })

return {
    'NvChad/nvim-colorizer.lua',
    -- event = "VeryLazy",
    keys = {
        { "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    },
    config = function()
        require 'colorizer'.setup {
            filetypes = {
                '*'; -- Highlight all files, but customize some others.
                css = { css = true; };
                '!vim'; -- Exclude vim from highlighting.
            },
            user_default_options = {
                names = false, -- "Name" codes like Blue or blue
            },
        }
    end
}
