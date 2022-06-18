local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require'packer'.startup({function(use)
  use 'wbthomason/packer.nvim'

  use {
    'lewis6991/impatient.nvim',
    config = function()
      require'impatient'
    end
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require'conf.onedark'
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'conf.lsp'
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      require'conf.cmp'
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require'conf.bufferline'
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require'nvim-tree'.setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require'conf.lualine'
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'conf.nvim-treesitter'
    end
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require'hop'.setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require'conf.indent-blankline'
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#303030 gui=nocombine]]
    end
  }

  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' }
  }

  use 'elixir-editors/vim-elixir'
  use 'sbdchd/neoformat'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'

  if packer_bootstrap then
    require('packer').sync()
  end

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
