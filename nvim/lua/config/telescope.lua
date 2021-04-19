local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').git_files(options)<CR>", opts)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fo",
    "<cmd>lua require('telescope').extensions.frecency.frecency(options)<CR>",
    opts
)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep(options)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string(options)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').git_status(options)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers(options)<CR>", opts)
