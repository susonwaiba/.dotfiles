return {
    {
        'theprimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            local extensions = require("harpoon.extensions");

            harpoon.setup()
            harpoon:extend(extensions.builtins.navigate_with_number());

            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>hf", function() toggle_telescope(harpoon:list()) end,
                { desc = "Harpoon find" })

            vim.keymap.set("n", "<M-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Harpoon menu" })
            vim.keymap.set("n", "<M-n>", function() harpoon:list():add() end, { desc = "Harpoon new item" })

            vim.keymap.set("n", "<M-j>", function() harpoon:list():select(1) end, { desc = "Nav no: 1" })
            vim.keymap.set("n", "<M-k>", function() harpoon:list():select(2) end, { desc = "Nav no: 2" })
            vim.keymap.set("n", "<M-l>", function() harpoon:list():select(3) end, { desc = "Nav no: 3" })
            vim.keymap.set("n", "<M-;>", function() harpoon:list():select(4) end, { desc = "Nav no: 4" })

            vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Nav previous" })
            vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Nav next" })
        end,
    },
}
