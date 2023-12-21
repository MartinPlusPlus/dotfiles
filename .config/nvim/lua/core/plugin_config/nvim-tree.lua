vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- this opens a prompt to search for a new file
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
