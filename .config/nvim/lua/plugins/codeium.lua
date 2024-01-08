return {
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        init = function()
            vim.g.codeium_disable_bindings = 1
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<M-y>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },
}
