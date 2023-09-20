-- LSP
vim.keymap.set("n", "<leader>lF", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format with comform" })


local on_attach = function(client, bufnr)
    if client.name == "phpactor" then
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>lr", vim.lsp.buf.rename, "Rename")
    nmap("<leader>la", vim.lsp.buf.code_action, "Code Action")

    nmap("gd", vim.lsp.buf.definition, "Goto Definitions")
    nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
    nmap("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
    nmap("<leader>ld", vim.lsp.buf.type_definition, "Type Definition")
    nmap("<leader>lsd", require("telescope.builtin").lsp_document_symbols, "Symbols of Document")
    nmap("<leader>lsw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Symbols of Workspace")

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<leader>lh", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
    nmap(
        "<leader>wl",
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        "Workspace List Folders"
    )

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(
        bufnr,
        "Format",
        function(_)
            vim.lsp.buf.format()
        end,
        { desc = "Format current buffer with LSP" }
    )
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},

    tsserver = { filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact' } },

    html = { filetypes = { 'html', 'twig', 'js', 'jsx', 'ts', 'tsx' } },
    tailwindcss = { filetypes = { 'html', 'twig', 'js', 'jsx', 'ts', 'tsx' } },

    phpactor = { filetypes = { 'php', 'twig' } },

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false }
        }
    }
}

-- Setup neovim lua configuration
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    library = {
        plugins = { "nvim-dap-ui" },
        types = true,
    },
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
        }
    end
}

require "lsp_signature".setup({})

-- Diagnostic

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- DAP
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

vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>dsO", ":lua require'dap'.step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { desc = "DapUI" })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
