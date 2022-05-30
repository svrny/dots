local g = vim.g
-- Disable built in plugins
local disabled_built_ins = {
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
}

for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end

if vim.version()['minor'] == 7 then
  g.do_filetype_lua = 1
  g.did_load_filetypes = 0
end

if not g.vscode then
  for _,mod in pairs({
    "options",
    "keymaps",
    "autocmd",
    "plugins"
  }) do
    require(mod)
  end
end
