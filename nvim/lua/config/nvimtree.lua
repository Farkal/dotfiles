local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opts)


