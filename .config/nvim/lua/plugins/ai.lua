local ollama_endpoint = "http://127.0.0.1:11434/v1"

return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			vendors = {
				ollama = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					-- proxy = nil, -- [protocol://]host[:port] Use this proxy
					-- model = "llama3.1:latest",
					model = "deepseek-r1:8b",
					-- model = "llama3.1:latest",
					-- model = "opencoder:latest",
					disable_tools = true, -- disable tools!
					stream = true, -- Optional
					-- temperature = 0.8,
					-- max_tokens = 4096,
					-- timeout = 60000, -- Timeout in milliseconds
					allow_insecure = true, -- Allow insecure server connections
				},
				ollama_deepseek_r1__1_5b = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					model = "deepseek-r1:1.5b",
					disable_tools = true, -- disable tools!
					stream = true, -- Optional
					allow_insecure = true, -- Allow insecure server connections
				},
				ollama_deepseek_r1_8b = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					model = "deepseek-r1:8b",
					disable_tools = true, -- disable tools!
					stream = true, -- Optional
					allow_insecure = true, -- Allow insecure server connections
				},
				ollama_llama3_1_8b = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					model = "llama3.1:latest",
					-- model = "deepseek-r1:8b",
					-- model = "opencoder:latest",
					-- disable_tools = true, -- disable tools!
					stream = true, -- Optional
					-- temperature = 0.8,
					-- max_tokens = 4096,
					-- timeout = 60000, -- Timeout in milliseconds
					allow_insecure = true, -- Allow insecure server connections
				},
				ollama_llama3_2__3_2b = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					model = "llama3.2:latest",
					-- disable_tools = true, -- disable tools!
					stream = true, -- Optional
					-- temperature = 0.8,
					-- max_tokens = 4096,
					-- timeout = 60000, -- Timeout in milliseconds
					allow_insecure = true, -- Allow insecure server connections
				},
				ollama_autocomplete = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = ollama_endpoint,
					model = "llama3.1:latest",
					-- model = "deepseek-r1:8b",
					-- model = "opencoder:latest",
					-- disable_tools = true, -- disable tools!
					stream = false, -- Optional
					temperature = 0.8,
					max_tokens = 4096,
					timeout = 5000, -- Timeout in milliseconds
					allow_insecure = true, -- Allow insecure server connections
				},
			},
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
			provider = "ollama_deepseek_r1_8b",
			auto_suggestions_provider = "ollama_autocomplete",
			behaviour = {
				auto_suggestions = true, -- Experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
				minimize_diff = true,
			},
			mappings = {
				--- @class AvanteConflictMappings
				suggestion = {
					accept = "<M-y>",
					next = "<M-n>",
					prev = "<M-p>",
					dismiss = "<M-q>",
				},
			},
			hints = { enabled = true },
			history = {
				max_tokens = 4096,
				storage_path = vim.fn.stdpath("state") .. "/avante",
				paste = {
					extension = "png",
					filename = "pasted-%Y-%m-%d-%H-%M-%S",
				},
			},
			--- @class AvanteFileSelectorConfig
			file_selector = {
				--- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
				provider = "telescope",
				-- Options override for custom providers
				provider_opts = {},
			},
			windows = {
				---@type "right" | "left" | "top" | "bottom"
				position = "right", -- the position of the sidebar
				wrap = true, -- similar to vim.o.wrap
				width = 30, -- default % based on available width
				sidebar_header = {
					enabled = true, -- true, false to enable/disable the header
					align = "center", -- left, center, right for title
					rounded = true,
				},
				input = {
					prefix = "> ",
					height = 8, -- Height of the input window in vertical layout
				},
				edit = {
					border = "rounded",
					start_insert = false, -- Start insert mode when opening the edit window
				},
				ask = {
					floating = false, -- Open the 'AvanteAsk' prompt in a floating window
					start_insert = true, -- Start insert mode when opening the ask window
					border = "rounded",
					---@type "ours" | "theirs"
					focus_on_apply = "ours", -- which diff to focus after applying
				},
			},
			--- @class AvanteConflictUserConfig
			diff = {
				autojump = true,
				---@type string | fun(): any
				list_opener = "copen",
				--- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
				--- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
				--- Disable by setting to -1.
				override_timeoutlen = 500,
			},
			highlights = {
				---@type AvanteConflictHighlights
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},
			suggestion = {
				debounce = 600,
				throttle = 600,
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.icons",
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			-- {
			-- 	"zbirenbaum/copilot.lua",
			-- 	cmd = "Copilot",
			-- 	event = "InsertEnter",
			-- 	config = function()
			-- 		require("copilot").setup({})
			-- 		vim.cmd(":Copilot auth")
			-- 	end,
			-- }, -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	init = function()
	-- 		-- vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_assume_mapped = true
	-- 		-- vim.g.copilot_tab_fallback = ""
	-- 		vim.api.nvim_set_keymap("i", "<M-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	-- 		vim.keymap.set("i", "<M-p>", "<cmd>Copilot panel<cr>", { desc = "Open Copilot panel" })
	-- 	end,
	-- },
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "BufEnter",
	-- 	init = function()
	-- 		vim.g.codeium_disable_bindings = 1
	-- 		-- Change '<C-g>' here to any keycode you like.
	-- 		vim.keymap.set("i", "<M-y>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<M-[>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<M-]>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<M-x>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true })
	-- 	end,
	-- },
}
