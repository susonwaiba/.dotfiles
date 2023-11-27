return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'ojroques/nvim-osc52',
        config = function()
            require('osc52').setup()
        end
    },
    'mbbill/undotree',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
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
            }
        },
        cmd = { "TSUpdateSync" },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { { 'kkharji/sqlite.lua' } }
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'theprimeagen/harpoon',

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    },
    {
        'sindrets/diffview.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },
    {
        -- Formatter
        'stevearc/conform.nvim',
    },

    'ray-x/lsp_signature.nvim',
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below

                use_diagnostic_signs = true
            }
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
    },

    {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function()
            require('nvim-autopairs').setup {}
            -- If you want to automatically add `(` after selecting a function or method
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            vim.g.codeium_disable_bindings = 1
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<M-y>', function() return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },

    {
        'blazkowolf/gruber-darker.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('gruber-darker')
        end
    },
    {
        'xiyaowong/transparent.nvim',
        priority = 1000,
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


    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function()
                            return "◯"
                        end,
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1,
                    },
                },
            },
        },
    },

    {
        'tpope/vim-dadbod',
    },
    {
        'kristijanhusak/vim-dadbod-ui',
    },
    {
        'rest-nvim/rest.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = 'kyazdani42/nvim-web-devicons',
    },

    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        'numToStr/FTerm.nvim',
    },
    {
        'nvim-neorg/neorg',
        ft = "norg",
        build = ':Neorg sync-parsers',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {}, -- Loads default behaviour
                    ['core.concealer'] = {  -- Adds pretty icons to your documents
                        config = {
                            folds = false,
                        }
                    },
                    ['core.dirman'] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = '~/.my-notes',
                            },
                            default_workspace = 'notes',
                        },
                    },
                    ['core.keybinds'] = {
                        config = {
                            hook = function(keybinds)
                                keybinds.remap_event('norg', 'n', '<Leader>nl', 'core.looking-glass.magnify-code-block')
                            end,
                        }
                    }
                }
            }
        end,
    }
}
