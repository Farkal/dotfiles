local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  -- Colorsheme
  use 'lifepillar/vim-gruvbox8'
  -- Statusbar
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = [[require('config.galaxyline')]],
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'chaoren/vim-wordmotion', {'justinmk/vim-sneak', config = [[require('config.sneak')]]}}
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('config.telescope')]],
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
        'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          },
          config = function()
            require('gitsigns').setup()
          end
        }
end)
