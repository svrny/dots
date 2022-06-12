local M = {};

M.setup = function()
  vim.opt.termguicolors = true
  vim.cmd [[highlight IndentBlanklineIndent1 guifg=#303030 gui=nocombine]]
  require("indent_blankline").setup {
    char = '▏',
    char_highlight_list = {
      "IndentBlanklineIndent1",
    },
  }
end

return M
