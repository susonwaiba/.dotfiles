return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    -- disable rtp plugin, as we only need its queries for mini.ai
                    -- In case other textobject modules are enabled, we will load them
                    -- once nvim-treesitter is loaded
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            },
            {
                'nvim-treesitter/playground',
            },
        },
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "lua", "luadoc", "vim", "vimdoc", "query", "bash", "markdown", "yaml" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            -- ignore_install = { "javascript" },

            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
