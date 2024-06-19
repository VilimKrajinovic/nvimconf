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
        'creativenull/efmls-configs-nvim',
        version = 'v1.x.x', -- version is optional, but recommended
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
    'rebelot/kanagawa.nvim',
    'xiyaowong/transparent.nvim',
    'sindrets/diffview.nvim',
    'echasnovski/mini.nvim',
    'echasnovski/mini.surround',

    'ray-x/lsp_signature.nvim',
    'theprimeagen/harpoon',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-dispatch',

    -- Clojure
    'tpope/vim-fireplace',
    'clojure-vim/vim-jack-in',
    'radenling/vim-dispatch-neovim',
    'hiphish/rainbow-delimiters.nvim',
}
