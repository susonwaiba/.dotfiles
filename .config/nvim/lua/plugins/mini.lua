return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		version = "*",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("mini.icons").setup()

			require("mini.basics").setup({
				mappings = {
					basic = true,
					option_toggle_prefix = [[\]],
					windows = false,
					move_with_alt = false,
				},
			})

			require("mini.ai").setup({ n_lines = 500 })

			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<C-h>",
					right = "<C-l>",
					down = "<C-j>",
					up = "<C-k>",

					-- Move current line in Normal mode
					line_left = "<C-h>",
					line_right = "<C-l>",
					line_down = "<C-j>",
					line_up = "<C-k>",
				},
			})

			require("mini.bufremove").setup()

			require("mini.operators").setup()

			require("mini.pairs").setup()

			require("mini.splitjoin").setup()

			require("mini.trailspace").setup()

			require("mini.surround").setup()

			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
					end,
				},
			})

			-- require('mini.completion').setup()

			vim.cmd([[highlight MiniStatuslineModeNormal guibg=#d78700 guifg=#262626]])
			local statusline = require("mini.statusline")
			statusline.setup()
			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			require("mini.git").setup()

			require("mini.diff").setup()

			require("mini.extra").setup()
		end,
	},
}
