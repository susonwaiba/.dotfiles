return {
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			icons = {
				mappings = false,
			},
			spec = {
				{ "<leader>a", desc = "+AI" },
				{ "<leader>f", desc = "+Find" },
				{ "<leader>fl", desc = "+Find LSP" },
				{ "<leader>fls", desc = "+Find LSP Symbol" },
				{ "<leader>t", desc = "+Todo" },
				{ "<leader>x", desc = "+Trouble" },
				{ "<leader>n", desc = "+Notes" },
				{ "<leader>nw", desc = "+Workspace" },
				{ "<leader>nm", desc = "+Mode" },
				{ "<leader>l", desc = "+LSP" },
				{ "<leader>ls", desc = "+LSP Symbol" },
				{ "<leader>d", desc = "+Diagnostic" },
				{ "<leader>w", desc = "+Workspace" },
				{ "<leader>g", desc = "+Git" },
				{ "<leader>h", desc = "+Harpoon" },
				{ "<leader>r", desc = "+Run" },
			},
		},
	},
}
