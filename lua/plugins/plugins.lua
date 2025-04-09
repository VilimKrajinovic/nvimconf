return {
  "xiyaowong/transparent.nvim",
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      scroll = { enabled = false },
      animate = { enabled = false },
    },
  },
  {
    "gbprod/phpactor.nvim",
    build = function()
      require("phpactor.handler.update")()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    'saghen/blink.cmp',
    opts = {
      signature = {enabled = true},
    }
  }
}
