return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function()
                            return "◯"
                        end,
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1,
                    },
                },
            },
        },
    },
}
