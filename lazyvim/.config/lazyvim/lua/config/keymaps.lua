-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<cr>", { silent = true, noremap = true })

vim.keymap.del("n", "s")
