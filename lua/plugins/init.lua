return {
    'nvim-tree/nvim-web-devicons',
    'mfussenegger/nvim-dap',

    {
        'leoluz/nvim-dap-go',
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
    },
    {
        "julienvincent/nvim-paredit",
        config = function()
            require("nvim-paredit").setup()
        end
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
    },
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'creativenull/efmls-configs-nvim',
        version = 'v1.7.0', -- version is optional, but recommended
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'linrongbin16/lsp-progress.nvim',
        config = function()
            require('lsp-progress').setup()
        end
    },
    'saadparwaiz1/cmp_luasnip',
    {
        "L3MON4D3/LuaSnip",
        lazy = false,
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    { "R-nvim/R.nvim",                 lazy = false,        version = "~0.1.0" },
    { "ellisonleao/gruvbox.nvim",      priority = 1000,     config = true },
    { 'ggandor/leap.nvim' },
    { 'akinsho/git-conflict.nvim',     version = "*",       config = true },
    { "catppuccin/nvim",               name = "catppuccin", priority = 1000 },
    { "scottmckendry/cyberdream.nvim", lazy = false,        priority = 1000 },
    { "bluz71/vim-nightfly-colors",    name = "nightfly",   lazy = false,      priority = 1000 },
    'aliqyan-21/darkvoid.nvim',
    'rebelot/kanagawa.nvim',
    'xiyaowong/transparent.nvim',
    'sindrets/diffview.nvim',
    'echasnovski/mini.nvim',
    'echasnovski/mini.surround',
    'RRethy/vim-illuminate',

    'windwp/nvim-ts-autotag',

    'ray-x/lsp_signature.nvim',
    'theprimeagen/harpoon',
    'nvim-treesitter/nvim-treesitter',
    {'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {'nvim-treesitter/nvim-treesitter'}},
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-dispatch',

    -- Clojure
    'tpope/vim-fireplace',
    'clojure-vim/vim-jack-in',
    'radenling/vim-dispatch-neovim',
    'hiphish/rainbow-delimiters.nvim',

    -- Elixir
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")

            elixir.setup {
                nextls = { enable = false },
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = false,
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                    end,
                },
                projectionist = {
                    enable = true
                }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    }
}
