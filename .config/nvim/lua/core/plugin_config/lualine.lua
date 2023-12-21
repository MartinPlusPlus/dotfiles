require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
    },
    section = {
        lualina_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
