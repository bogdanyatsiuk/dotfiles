return {
    {
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = true,
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                },
                tmux_show_only_in_active_window = false,
            })
        end,
        dependencies = {
            "https://github.com/leafo/magick"
        },
        ft = "markdown",
     },
    -- hakonharnes/img-clip.nvim
}
