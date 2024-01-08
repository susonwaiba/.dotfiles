return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
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
                    fzy_native = {
                        -- override_generic_sorter = false,
                        -- override_file_sorter = true,
                    }
                }
            })

            require('telescope').load_extension('frecency')
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("harpoon")

            local builtin = require('telescope.builtin')
            vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope frecency workspace=CWD<CR>", { desc = "Find Fast" })
            vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = "Find Files" })
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find Old files" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
            vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find Commands" })

            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })

            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "Find Word" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find using grep" })

            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find Diagnostics" })

            vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = "Find Git files" })


            vim.keymap.set('n', '<leader>fW', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end, { desc = "Find string" })


            vim.keymap.set('n', '<leader>fB', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = "Find in Buffer" })
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = { { 'nvim-telescope/telescope.nvim' } },
        build = 'make',
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { { 'kkharji/sqlite.lua' }, { 'nvim-telescope/telescope.nvim' } },
    }
}
