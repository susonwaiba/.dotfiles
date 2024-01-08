return {
    {
        'theprimeagen/harpoon',
        config = function()
            require("harpoon").setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 10,
                    height = vim.api.nvim_win_get_height(0) - 10,
                }
            })

            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<M-n>", mark.add_file, { desc = "Harpoon new item" })
            vim.keymap.set("n", "<M-h>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

            vim.keymap.set("n", "<M-j>", function() ui.nav_file(1) end, { desc = "Nav no: 1" })
            vim.keymap.set("n", "<M-k>", function() ui.nav_file(2) end, { desc = "Nav no: 2" })
            vim.keymap.set("n", "<M-l>", function() ui.nav_file(3) end, { desc = "Nav no: 3" })
            vim.keymap.set("n", "<M-;>", function() ui.nav_file(4) end, { desc = "Nav no: 4" })
        end,
    },
}
