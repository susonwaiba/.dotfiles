return {
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            local wk = require("which-key")

            wk.register({
                f = { name = "+Find" },
                ["fl"] = { name = "+Find LSP" },
                ["fls"] = { name = "+Find LSP Symbol" },

                t = { name = "+Todo" },
                x = { name = "+Trouble" },

                n = { name = "+Notes" },
                ["nw"] = { name = "+Workspace" },
                ["nm"] = { name = "+Mode" },

                l = { name = "+LSP" },
                ["ls"] = { name = "+LSP Symbol" },
                d = { name = "+Diagnostic" },

                w = { name = "+Workspace" },

                g = { name = "+Git" },

                h = { name = "+Harpoon" },

                r = { name = "+Run" },

            }, { prefix = "<leader>" })
        end,
    },
}
