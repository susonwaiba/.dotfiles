return {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			signs = false,
		},
		config = function()
			vim.keymap.set("n", "<leader>tl", "<cmd>:TodoQuickFix<CR>", { desc = "Todo quick fix" })
			vim.keymap.set("n", "<leader>tt", "<cmd>:TodoTrouble<CR>", { desc = "Todo trouble" })
			vim.keymap.set("n", "<leader>tf", "<cmd>:TodoTelescope<CR>", { desc = "Todo find" })
		end,
	},
}
