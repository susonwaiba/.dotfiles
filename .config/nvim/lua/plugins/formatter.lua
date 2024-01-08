return {
    {
        'stevearc/conform.nvim',
        config = function()
            require('conform').setup {
                notify_on_error = true,
                formatters_by_ft = {
                    php = { "php_cs_fixer" }
                },
                -- format_after_save = {
                --     lsp_fallback = true,
                -- },
                formatters = {
                    php_cs_fixer = {
                        command = "php-cs-fixer",
                        args = {
                            '--rules=@Symfony',
                            '--using-cache=no',
                            '--no-interaction',
                            '--quiet',
                            'fix',
                            "$FILENAME",
                        },
                        stdin = false,
                        exit_codes = { 0, 1 },
                    }
                }
            }
        end,
    },
}
