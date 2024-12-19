return {
	{
		"numToStr/FTerm.nvim",
		init = function()
			vim.keymap.set("n", "<A-t>", '<CMD>lua require("FTerm").toggle()<CR>')
			vim.keymap.set("t", "<A-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		end,
		config = function()
			require("FTerm").setup({
				border = "double",
				dimensions = {
					height = 1,
					width = 1,
				},
			})
		end,
	},
}
