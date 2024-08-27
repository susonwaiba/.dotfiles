return {
    {
        'blazkowolf/gruber-darker.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme('gruber-darker')
        end
    },
    -- { -- You can easily change to a different colorscheme.
    --     -- Change the name of the colorscheme plugin below, and then
    --     -- change the command in the config to whatever the name of that colorscheme is
    --     --
    --     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    --     'folke/tokyonight.nvim',
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('tokyonight').setup {
    --             style = 'night',
    --             transparent = true,
    --         }
    --         -- Load the colorscheme here
    --         vim.cmd.colorscheme 'tokyonight-night'
    --
    --         -- You can configure highlights by doing something like
    --         vim.cmd.hi 'Comment gui=none'
    --     end,
    -- },
    {
        'xiyaowong/transparent.nvim',
        priority = 999,
        config = function()
            require('transparent').setup({
                groups = { -- table: default groups
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
                },
                extra_groups = {
                    "NormalFloat",   -- plugins which have float panel such as Lazy, Mason, LspInfo
                    "NvimTreeNormal" -- NvimTree
                },                   -- table: additional groups that should be cleared
                exclude_groups = {}, -- table: groups you don't want to clear
            })
        end
    },
}
