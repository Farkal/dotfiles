local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local opt, map = utils.opt, utils.map

-- Inspirated from https://github.com/disrupted/dotfiles


-- Leader key
g.mapleader = ","


local window = {o, wo}
local buffer = {o, bo}
-- Allow vim-sneak labels mode 
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)

opt('number', true, window)
opt('relativenumber', true, window)
opt('numberwidth', 2, window)
opt('hidden', true)
opt('mouse', 'nivh')
opt('tabstop', 2, buffer)
opt('shiftwidth', 0, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('autoindent', true, buffer)
opt('smartindent', true, buffer)
opt('clipboard', 'unnamedplus')

local silent = {silent = true}

map('i', 'kk', '<esc>', silent)
map('i', 'jj', '<esc>', silent)
map('t', '<C-W><C-n>', '<C-\\><C-n>', {noremap = true})
-- Config shortcuts
map('n', '<leader>ec', ':e $MYVIMRC<CR>', silent)
map('n', '<leader>sc', ':luafile $MYVIMRC<CR>', silent)

require('plugins')

-- Colorsheme
-- TODO: try gruvbox.nvim
opt('termguicolors', true)
cmd 'colorscheme base16-onedark'
