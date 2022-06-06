local opt = vim.opt

-- Enable mouse
opt.mouse = 'a'
opt.mousefocus = true

-- Don`t show mode
opt.showmode = false

-- Lines wrap at words
opt.linebreak = true

-- Disable preview window
opt.completeopt = 'menu'

opt.runtimepath = opt.runtimepath + "~/.fzf"

-- Indentation
opt.wrap = true
opt.wrapmargin = 2
opt.textwidth = 80
opt.autoindent = true
opt.shiftround = true
opt.expandtab = true
opt.shiftwidth = 2

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Draw signcolumn in numbers secion
opt.signcolumn = 'number'

-- Display numbers
opt.number = true

-- Chars to represent tabs and trailing spaces
opt.list = true
opt.listchars = {
  tab = '␉·',
  trail = '•'
}

-- Disable swapfile
opt.swapfile = false

-- Ignore case in search
opt.ignorecase = true

-- Override ignorecase if the search pattern contains upper case characters
opt.smartcase = true

-- Enables 24-bit RGB color in the TUI.
opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 5

-- Disaple startup screen
opt.shortmess = { I = true }
