return {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("xcodebuild").setup({
            -- put some options here or leave it empty to use default settings
        })
    end,
}
