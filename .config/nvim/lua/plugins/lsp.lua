return {
	-- LSP Configuration & Plugins
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy.nvim",
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"LazyVim",
				"nvim-dap-ui",
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-T>.
					map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "Goto References")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>ld", require("telescope.builtin").lsp_type_definitions, "Type Definition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>lsd", require("telescope.builtin").lsp_document_symbols, "Symbols of Document")

					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map(
						"<leader>lsw",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"Symbols of Workspace"
					)

					-- Rename the variable under your cursor
					--  Most Language Servers support renaming across files, etc.
					map("<leader>lr", vim.lsp.buf.rename, "Rename")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>la", vim.lsp.buf.code_action, "Action", { "n", "x" })

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")

					map("<leader>lh", vim.lsp.buf.signature_help, "Signature Documentation")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup = vim.api.nvim_create_augroup("my-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("my-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "my-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>lth", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Toggle Inlay Hints")
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			-- NOTE: The following line is now commented as blink.cmp extends capabilites by default from its internal code:
			-- https://github.com/Saghen/blink.cmp/blob/102db2f5996a46818661845cf283484870b60450/plugin/blink-cmp.lua
			-- It has been left here as a comment for educational purposes (as the predecessor completion plugin required this explicit step).
			--
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Language servers can broadly be installed in the following ways:
			--  1) via the mason package manager; or
			--  2) via your system's package manager; or
			--  3) via a release binary from a language server's repo that's accessible somewhere on your system.

			-- The servers table comprises of the following sub-tables:
			-- 1. mason
			-- 2. others
			-- Both these tables have an identical structure of language server names as keys and
			-- a table of language server configuration as values.
			---@class LspServersConfig
			---@field mason table<string, vim.lsp.Config>
			---@field others table<string, vim.lsp.Config>
			local servers = {
				--  Add any additional override configuration in any of the following tables. Available keys are:
				--  - cmd (table): Override the default command used to start the server
				--  - filetypes (table): Override the default list of associated filetypes for the server
				--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
				--  - settings (table): Override the default settings passed when initializing the server.
				--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
				--
				--  Feel free to add/remove any LSPs here that you want to install via Mason. They will automatically be installed and setup.
				mason = {
					-- clangd = {},
					-- gopls = {},
					-- pyright = {},
					-- rust_analyzer = {},
					-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
					--
					-- Some languages (like typescript) have entire language plugins that can be useful:
					--    https://github.com/pmizio/typescript-tools.nvim
					--
					-- But for many setups, the LSP (`ts_ls`) will work just fine
					-- ts_ls = {},
					--
					ts_ls = {
						init_options = {
							preferences = {
								importModuleSpecifier = "non-relative",
								importModuleSpecifierPreference = "non-relative",
							},
						},
					},
					lua_ls = {
						-- cmd = { ... },
						-- filetypes = { ... },
						-- capabilities = {},
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
								-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
								-- diagnostics = { disable = { 'missing-fields' } },
							},
						},
					},
				},
				-- This table contains config for all language servers that are *not* installed via Mason.
				-- Structure is identical to the mason table from above.
				others = {
					-- dartls = {},
				},
			}
			local ensure_installed = vim.tbl_keys(servers.mason or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format lua code
				"codespell",
				-- formatter
				"isort",
				"black",
				"prettierd",
				"eslint_d",
				-- lint
				"markdownlint",
				"jsonlint",
				"hadolint",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- Either merge all additional server configs from the `servers.mason` and `servers.others` tables
			-- to the default language server configs as provided by nvim-lspconfig or
			-- define a custom server config that's unavailable on nvim-lspconfig.
			for server, config in pairs(vim.tbl_extend("keep", servers.mason, servers.others)) do
				if not vim.tbl_isempty(config) then
					vim.lsp.config(server, config)
				end
			end

			-- After configuring our language servers, we now enable them
			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_enable = true, -- automatically run vim.lsp.enable() for all servers that are installed via Mason
			})

			-- Manually run vim.lsp.enable for all language servers that are *not* installed via Mason
			if not vim.tbl_isempty(servers.others) then
				vim.lsp.enable(vim.tbl_keys(servers.others))
			end
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp_signature").setup({})
		end,
	},
}
