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
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})

local builtin = require('telescope.builtin')

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'frecency')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require('telescope').load_extension, 'harpoon')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find Old files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })

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
