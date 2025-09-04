-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local leap = require("leap")

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>') -- terminal esc to go to normal mode
vim.keymap.set("t", "jj", '<C-\\><C-n>') -- terminal jj to go to normal mode


-- Bidirectional leap
vim.keymap.set("n", "s", function()
  leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
end)

local cmake = require('cmake-tools');

vim.keymap.set("n", "<leader>cpb", function()
  cmake.build({}, {});
end, {desc = "Clang build C++"})

vim.keymap.set("n", "<leader>cpr", function()
  cmake.run({}, {})
end, {desc = "Clang run C++"})


