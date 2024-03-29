local g = vim.g
local opts = {noremap = true, silent = true}

require("nvim-tree").setup {}
g.nvim_tree_side = "left"
g.nvim_tree_width = 35
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 0

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opts)


