return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format with comform",
			},
			{
				"<leader>lF",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				mode = "",
				desc = "LSP format",
			},
		},
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				html = { "prettierd", "eslint_d" },
				htmldjango = { "prettierd", "eslint_d" },
				php = { "php_cs_fixer" },
				["*"] = { "codespell" },
			},
			formatters = {
				php_cs_fixer = {
					command = "php-cs-fixer",
					args = {
						"--rules=@Symfony",
						"--using-cache=no",
						"--no-interaction",
						"--quiet",
						"fix",
						"$FILENAME",
					},
					stdin = false,
					exit_codes = { 0, 1 },
				},
			},
		},
	},
}
