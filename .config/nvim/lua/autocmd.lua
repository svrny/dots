function augroup(name, commands)
  vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(commands) do
    local is_callback = type(autocmd.command) == 'function'
    vim.api.nvim_create_autocmd(autocmd.event, {
      group = name,
      pattern = autocmd.pattern,
      desc = autocmd.description,
      callback = is_callback and autocmd.command or nil,
      command = not is_callback and autocmd.command or nil,
      once = autocmd.once,
      nested = autocmd.nested,
      buffer = autocmd.buffer,
    })
  end
end

augroup('RnuToggle', {
  {
    event = { 'FocusGained', 'BufEnter', 'InsertLeave' },
    pattern = '*',
    command = function()
      vim.wo.relativenumber = true
    end,
  },
  {
    event = { 'FocusLost', 'BufLeave', 'InsertEnter' },
    pattern = '*',
    command = function()
      vim.wo.relativenumber = false
    end,
  }
})

augroup('TextYankHighlight', {
  {
    event = { 'TextYankPost' },
    pattern = '*',
    command = function()
      vim.highlight.on_yank({
        timeout = 700,
        on_visual = false,
        higroup = 'Visual',
      })
    end,
  },
})
