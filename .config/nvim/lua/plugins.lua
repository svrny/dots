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
      require'onedark'.setup {
        transparent = true,
        code_style = { functions = 'italic', },
      }
      require'onedark'.load()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      local custom_onedark = require'lualine.themes.onedark'
      custom_onedark.normal.b.bg = "#303030"
      custom_onedark.normal.c.bg = nil
      require('lualine').setup {
        options = {
          theme = custom_onedark,
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
        },
      }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          disable = { "elixir" }
        }
      }
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  use 'junegunn/fzf.vim'
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
