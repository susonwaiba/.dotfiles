return {
    {
        'stevearc/conform.nvim',
        config = function()
            require('conform').setup {
                notify_on_error = false,
                formatters_by_ft = {
                    php = { "php_cs_fixer" },
                    javascript = { "prettierd" },
                    javascriptreact = { "prettierd" },
                    typescript = { "prettierd" },
                    typescriptreact = { "prettierd" },
                    html = { "prettierd" },
                    htmldjango = { "prettierd" },
                    ["*"] = { "codespell" },
                },
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

            vim.keymap.set("n", "<leader>lF", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
            vim.keymap.set("n", "<leader>lf", function()
                require("conform").format({
                    async = true,
                    lsp_fallback = true
                })
            end, { desc = "Format with comform" })
        end,
    },
}
