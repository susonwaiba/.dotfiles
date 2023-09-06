vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

require('mason.settings').set({
	ui = {
		border = 'rounded'
	}
})

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-Space'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "friendly-snippets" },
	}, {
		{ name = "buffer" },
	})
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = false,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = 'local',
	sign_icons = {
		error = '✘',
		warn = '▲',
		hint = '⚑',
		info = ''
	}
})

lsp.on_attach(function(client, bufnr)
	if client.name == "phpcsfixer" then
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end
	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gd", function() vim.lsp.buf.definition() end, "Goto Definitions")
	nmap("gD", function() vim.lsp.buf.declaration() end, "Goto Declaration")
	nmap("gI", function() vim.lsp.buf.implementation() end, "Goto Implementation")
	nmap("gr", require('telescope.builtin').lsp_references, "Goto References")

	nmap("<leader>ld", function() vim.lsp.buf.type_definition() end, "Type definition")
	nmap("<leader>lsd", require('telescope.builtin').lsp_document_symbols, "Symbols of Document")
	nmap("<leader>lsw", require('telescope.builtin').lsp_dynamic_workspace_symbols, "Symbols of Workspace")

	nmap("<leader>lr", function() vim.lsp.buf.rename() end, "Rename")
	nmap("<leader>la", function() vim.lsp.buf.code_action() end, "Code Action")

	nmap("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")

	nmap("K", function() vim.lsp.buf.hover() end, "Hover")
	nmap("<leader>lh", function() vim.lsp.buf.signature_help() end, "Signature Help")

	nmap("<leader>lws", function() vim.lsp.buf.workspace_symbol() end, "Workspace Symbol")
	nmap("<leader>lr", function() vim.lsp.buf.references() end, "References")

	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
	nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List Workspace Folder")

	-- Diagnostic keymaps
	-- nmap('<leader>dp', vim.diagnostic.goto_prev, "Prev")
	-- nmap('<leader>dn', vim.diagnostic.goto_next, "Next")
	-- nmap('<leader>df', vim.diagnostic.open_float, "Float")
	-- nmap('<leader>dl', vim.diagnostic.setloclist, "Set Loclist")
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

local mason_nullls = require("mason-null-ls")

mason_nullls.setup({
	debug = true,
	automatic_installation = true,
	automatic_setup = true,
})

local null_ls = require("null-ls");
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.phpcsfixer.with({
			filetypes = { "html", "php", "phtml", ".html.twig" },
		}),
	}
})

vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>dsO", ":lua require'dap'.step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { desc = "DapUI" })

local dap = require('dap')

dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
	-- args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		hostname = 'fpm',
		port = 9000
	}
}

require("dapui").setup()

require "lsp_signature".setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
	{ silent = true, noremap = true }
)
