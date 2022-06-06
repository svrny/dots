local custom_onedark = require'lualine.themes.onedark'
custom_onedark.normal.b.bg = '#353535'
custom_onedark.normal.c.bg = '#1f1f1f'

require('lualine').setup {
  options = {
    theme = custom_onedark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  extensions = {
    'nvim-tree',
    'toggleterm'
  }
}
