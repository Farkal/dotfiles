local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    use {"wbthomason/packer.nvim", opt = true}
    -- Colorsheme
    -- use 'lifepillar/vim-gruvbox8'
    -- use "rakr/vim-one"
    use "fnune/base16-vim"
    -- Statusbar
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      -- your statusline
      config = [[require('config.galaxyline')]],
      -- some optional icons
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "907th/vim-auto-save" -- Auto save
    use "psliwka/vim-smoothie" -- Smooth scroll
    use {"norcalli/nvim-colorizer.lua", config = [[require('colorizer').setup()]]} -- Display colors on hex tags
    use {"windwp/nvim-autopairs", config = [[require('config.autopairs')]]}
    use {"b3nj5m1n/kommentary", config = [[require('config.kommentary')]]}
    use {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }
    use {
      "chaoren/vim-wordmotion",
      config = [[require('config.wordmotion')]]
    }
    -- use {"justinmk/vim-sneak", config = [[require('config.sneak')]]}
    use {"ggandor/lightspeed.nvim"}
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = {"VimEnter *"},
      config = [[require('config.indentline')]]
    }
    use {
      "kyazdani42/nvim-tree.lua",
      -- cmd = {'NvimTreeOpen', 'NvimTreeToggle'},
      config = [[require('config.nvimtree')]],
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {
      "nvim-telescope/telescope.nvim",
      config = [[require('config.telescope')]],
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    -- use {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   requires = {"tami5/sql.nvim"},
    --   config = function()
    --     require "telescope".load_extension("frecency")
    --   end
    -- }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = [[require('config.gitsigns')]]
    }
    use {
      "akinsho/nvim-toggleterm.lua",
      config = [[require('config.toggleterm')]]
      -- branch = "feature/allow-specifying-directory",
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      event = {"BufRead *"},
      requires = {
        -- treesitter plugins
        {
          "nvim-treesitter/nvim-treesitter-refactor",
          after = "nvim-treesitter"
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          after = "nvim-treesitter"
        }
      },
      run = ":TSUpdate",
      config = [[require('config.treesitter')]]
    }
    use {"hrsh7th/nvim-compe", config = [[require("config.nvim-compe")]]}
    use {
      "neovim/nvim-lspconfig",
      event = {"VimEnter"},
      config = [[require('config.lsp')]],
      requires = {
        {"alexaandru/nvim-lspupdate", cmd = "LspUpdate"},
        {"nvim-lua/lsp-status.nvim"}
      }
    }
    -- use {
    --   "simrat39/rust-tools.nvim",
    --   requires = {"neovim/nvim-lspconfig"},
    --   config = function()
    --     require "rust-tools".setup {}
    --   end
    -- }
  end
)
