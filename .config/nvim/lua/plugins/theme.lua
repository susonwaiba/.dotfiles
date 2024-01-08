return {
    {
        'blazkowolf/gruber-darker.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme('gruber-darker')
        end
    },
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
