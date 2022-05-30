local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable search highlight
map('n', '<ESC>', ':nohl<CR>', opts)

-- Fast save and exit
map('n', '<INS>', ':wqa!<CR>', opts)

-- Toggle colorcolumn
map('n', '<leader>tt', ':exe "set cc=" . (&cc == "" ? "80" : "")<CR>', opts)

-- Toggle colorizer
map('n', '<leader>ct', ':ColorizerToggle<CR>', opts)

-- Toggle indentblankline
map('n', '<leader>ib', ':IndentBlanklineToggle<CR>', opts)

-- Cycle through buffers using tab
map('n', '<TAB>', ':bn<CR>', opts)
map('n', '<S-TAB>', ':bp<CR>', opts)

-- Cycle through buffers using tab
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

-- Hop.nvim
map('n', '<leader>ha', ':HopWordAC<CR>', opts)
map('n', '<leader>hb', ':HopWordBC<CR>', opts)
map('n', '<leader>ll', ':HopLine<CR>', opts)
map('n', 'f', ":HopPatternCurrentLineAC<cr>", opts)
map('n', 'F', ":HopPatternCurrentLineBC<cr>", opts)
-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
