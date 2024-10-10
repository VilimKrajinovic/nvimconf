return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        --- Uncomment these if you want to manage the language servers from neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- LSP Support
        'neovim/nvim-lspconfig',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
    }
}
