return {
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
        'ojroques/nvim-osc52',
        config = function()
            require('osc52').setup()
        end
    },
    'numToStr/FTerm.nvim',

    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',

    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'sindrets/diffview.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',

    'folke/neodev.nvim',
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
    'github/copilot.vim',

    {
        'rcarriga/nvim-dap-ui',
        dependencies = { { 'mfussenegger/nvim-dap' } }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },
    'tpope/vim-sleuth',
    {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                }
            })
            -- vim.cmd('colorscheme github_dark')
            -- vim.cmd('colorscheme github_dark_high_contrast')
            vim.cmd('colorscheme github_light')
            -- vim.cmd('colorscheme github_light_high_contrast')
        end,
    },
    {
        'blazkowolf/gruber-darker.nvim',
        config = function()
            -- vim.cmd.colorscheme('gruber-darker')
        end
    },
    {
        'xiyaowong/transparent.nvim',
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

    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true } },

    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {
                window = {
                    blend = 0,
                },
            }
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        'ellisonleao/glow.nvim',
        config = function()
            require('glow').setup {
                -- config goes here
            }
        end,
    },

    {
        'rest-nvim/rest.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',

    {
        'tamago324/lir.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'tamago324/lir-mmv.nvim',
            'tamago324/lir-git-status.nvim',
            'tamago324/lir-bookmark.nvim',
            'nvim-lua/plenary.nvim',
        }
    },
    {
        'folke/which-key.nvim',
        lazy = true,
        config = function()
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        'nvim-neorg/neorg',
        build = ':Neorg sync-parsers',
        dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' } },
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
                    },
                    ['core.integrations.telescope'] = {},
                }
            }
        end,
    }
}
