return {
    {
        'stevearc/oil.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        keys = {
            {"-", "<CMD>Oil<CR>", desc = "Open parent directory"},
        },
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<leader>e"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["g."] = "actions.toggle_hidden",
            },
            view_options = {
                show_hidden = true,
            },
        },
    },
}
