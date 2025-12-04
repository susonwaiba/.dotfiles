return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",

			-- Installs the debug adapters for you
			"mason-org/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		init = function()
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})
		end,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
				},
			})

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				--    Feel free to remove or use ones that you like more! :)
				--    Don't feel like these are good choices.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue" })
			vim.keymap.set("n", "<leader>dso", dap.step_into, { desc = "Step over" })
			vim.keymap.set("n", "<leader>dsi", dap.step_over, { desc = "Step into" })
			vim.keymap.set("n", "<leader>dsO", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set(
				"n",
				"<leader>dB",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				{ desc = "Set conditional breakpoint" }
			)
			vim.keymap.set(
				"n",
				"<leader>dp",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
				{ desc = "Set log point" }
			)
			vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
			vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { desc = "DapUI" })
		end,
	},
}
