-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local leap = require("leap")

vim.keymap.set("i", "jj", "<Esc>")

-- Bidirectional leap
vim.keymap.set("n", "s", function()
  leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
end)
