--[[ vim.highlight.create(
  'IndentBlanklineChar',
  { guibg = '#333842', gui = 'nocombine' },
false) ]]
vim.cmd [[highlight IndentBlanklineChar guifg=#C678DD gui=nocombine]]
require'indent_blankline'.setup {
  char = '▏',
  char_highlight_list = { "IndentBlanklineChar" }
}
