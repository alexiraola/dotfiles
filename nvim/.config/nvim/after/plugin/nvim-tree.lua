local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
  return
end

nvimtree.setup()

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')
