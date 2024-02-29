return {
    {
        'tpope/vim-rhubarb'
    },
    {
        'tpope/vim-fugitive',
        init = function()
            vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git fugitive" })
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
            vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diffview open" })
            vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Git diffview close" })
        end
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    },
    {
        'sindrets/diffview.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
}
