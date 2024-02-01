return {
    {
        'github/copilot.vim',
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            -- vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            -- vim.g.copilot_tab_fallback = ""
            vim.api.nvim_set_keymap("i", "<M-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.keymap.set("i", "<M-p>", "<cmd>Copilot panel<cr>", { desc = "Open Copilot panel" })
        end
    },
}
