return {
  { "rebelot/kanagawa.nvim" },
  { "slugbyte/lackluster.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "morhetz/gruvbox" },
  { "alljokecake/naysayer-theme.nvim", as = "naysayer" },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
  },
  {
    "aliqyan-21/darkvoid.nvim",
    opts = {
      transparent = true,
      glow = true,
      show_end_of_buffer = true,

      colors = {
        fg = "#c0c0c0",
        bg = "#1c1c1c",
        cursor = "#bdfe58",
        line_nr = "#323232",
        visual = "#303030",
        comment = "#585858",
        string = "#3772FF",
        func = "#1bfd9c",
        kw = "#f1f1f1",
        identifier = "#b1b1b1",
        type = "#1bfd9c",
        type_builtin = "#c5c5c5", -- current
        -- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
        search_highlight = "#FF6666",
        operator = "#1bfd9c",
        bracket = "#e6e6e6",
        preprocessor = "#4b8902",
        bool = "#66b2b2",
        constant = "#b2d8d8",

        -- enable or disable specific plugin highlights
        plugins = {
          gitsigns = true,
          nvim_cmp = true,
          treesitter = true,
          nvimtree = true,
          telescope = true,
          lualine = true,
          bufferline = true,
          oil = true,
          whichkey = true,
          nvim_notify = true,
        },

        -- gitsigns colors
        added = "#baffc9",
        changed = "#ffffba",
        removed = "#ffb3ba",

        -- Pmenu colors
        pmenu_bg = "#1c1c1c",
        pmenu_sel_bg = "#1bfd9c",
        pmenu_fg = "#c0c0c0",

        -- EndOfBuffer color
        eob = "#3c3c3c",

        -- Telescope specific colors
        border = "#585858",
        title = "#bdfe58",

        -- bufferline specific colors
        bufferline_selection = "#1bfd9c",

        -- LSP diagnostics colors
        error = "#dea6a0",
        warning = "#7d9882",
        hint = "#bedc74",
        info = "#7fa1c3",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
