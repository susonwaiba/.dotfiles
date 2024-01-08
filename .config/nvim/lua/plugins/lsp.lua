return {
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
        config = function()
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
                nmap("<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "Workspace List Folders")

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })
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
            }

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

            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    },
}
