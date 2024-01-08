return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'ojroques/nvim-osc52',
        config = function()
            require('osc52').setup()
        end
    },
}
