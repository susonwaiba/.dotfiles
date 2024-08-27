return {
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {
                -- preset = 'modern',
                icons = {
                    mappings = false,
                }
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            local wk = require("which-key")
            wk.add({
                { '<leader>f',   desc = "+Find" },
                { '<leader>fl',  desc = "+Find LSP" },
                { '<leader>fls', desc = "+Find LSP Symbol" },
                { '<leader>t',   desc = "+Todo" },
                { '<leader>x',   desc = "+Trouble" },
                { '<leader>n',   desc = "+Notes" },
                { '<leader>nw',  desc = "+Workspace" },
                { '<leader>nm',  desc = "+Mode" },
                { '<leader>l',   desc = "+LSP" },
                { '<leader>ls',  desc = "+LSP Symbol" },
                { '<leader>d',   desc = "+Diagnostic" },
                { '<leader>w',   desc = "+Workspace" },
                { '<leader>g',   desc = "+Git" },
                { '<leader>h',   desc = "+Harpoon" },
                { '<leader>r',   desc = "+Run" },

            })
        end,
    },
}
