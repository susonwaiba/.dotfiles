return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                }
            })

            require('telescope').load_extension('fzf')
            require("telescope").load_extension("harpoon")
            require("telescope").load_extension("ui-select")

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ cwd = vim.loop.cwd() }) end,
                { desc = "Find Files" })
            vim.keymap.set('n', '<leader>fo', function() builtin.oldfiles({ cwd = vim.loop.cwd() }) end,
                { desc = "Find Old files" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
            vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find Commands" })

            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
            vim.keymap.set('n', '<leader>fH', builtin.man_pages, { desc = "Find Man Pages" })

            vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find using grep" })
            vim.keymap.set('n', '<leader>fW', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end,
                { desc = "Find string" })
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find Word Selection" })

            vim.keymap.set('n', '<leader>fB', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = "Find in Buffer" })

            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Find Resume" })

            vim.keymap.set('n', '<leader>fla', builtin.lsp_references, { desc = "Find LSP References" })
            vim.keymap.set('n', '<leader>flr', builtin.lsp_references, { desc = "Find LSP References" })
            vim.keymap.set('n', '<leader>flci', builtin.lsp_incoming_calls, { desc = "Find LSP Incoming Calls" })
            vim.keymap.set('n', '<leader>flco', builtin.lsp_outgoing_calls, { desc = "Find LSP Outgoing Calls" })
            vim.keymap.set('n', '<leader>fls', builtin.lsp_document_symbols, { desc = "Find LSP Document Symbols" })
            vim.keymap.set('n', '<leader>flS', builtin.lsp_workspace_symbols, { desc = "Find LSP Workspace Symbols" })
            vim.keymap.set('n', '<leader>flx', builtin.diagnostics, { desc = "Find LSP Diagnostics" })
            vim.keymap.set('n', '<leader>fli', builtin.lsp_implementations, { desc = "Find LSP Implementations" })
            vim.keymap.set('n', '<leader>fld', builtin.lsp_definitions, { desc = "Find LSP Definitions" })
            vim.keymap.set('n', '<leader>flD', builtin.lsp_type_definitions, { desc = "Find LSP Type Definitions" })

            vim.keymap.set('n', '<leader>fgf', builtin.git_files, { desc = "Find Git files" })
            vim.keymap.set('n', '<leader>fgs', builtin.git_status, { desc = "Find Git status" })
            vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = "Find Git branches" })
            vim.keymap.set('n', '<leader>fgc', builtin.git_commits, { desc = "Find Git commits" })
            vim.keymap.set('n', '<leader>fgbc', builtin.git_bcommits, { desc = "Find Git buffer commits" })
            vim.keymap.set('n', '<leader>fgbC', builtin.git_bcommits_range, { desc = "Find Git buffer commits range" })
        end
    },
}
