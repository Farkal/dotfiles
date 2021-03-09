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
  -- use 'lifepillar/vim-gruvbox8'
  use "rakr/vim-one"
  -- Statusbar
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = [[require('config.galaxyline')]],
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'psliwka/vim-smoothie' -- Smooth scroll
  use 'b3nj5m1n/kommentary'
  use {'chaoren/vim-wordmotion', {'justinmk/vim-sneak', config = [[require('config.sneak')]]}}
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    event = {'VimEnter *'},
    config = [[require('config.indentline')]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    -- cmd = {'NvimTreeOpen', 'NvimTreeToggle'},
    setup = [[require('config.nvimtree')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
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
    config = [[require('config.gitsigns')]]
  }
  use {
    "akinsho/nvim-toggleterm.lua",
    config = [[require('config.toggleterm')]],
    -- branch = "feature/allow-specifying-directory",
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    event = {'BufRead *'},
    requires = {
        -- treesitter plugins
        {
            'nvim-treesitter/nvim-treesitter-refactor',
            after = 'nvim-treesitter'
        },
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter'
        }
    },
    run = ':TSUpdate',
    config = [[require('config.treesitter')]]
  }
  use {
    'neovim/nvim-lspconfig',
    event = {'VimEnter'},
    config = [[require('config.lsp')]],
    requires = {
      {"alexaandru/nvim-lspupdate", cmd = "LspUpdate"},
      {'nvim-lua/lsp-status.nvim'}
    }
  }

end)
