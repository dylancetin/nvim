local setStatuslineColors = function()
  local set_default_hl = function(name, data)
    data.default = true
    vim.api.nvim_set_hl(0, name, data)
  end

  set_default_hl('MiniStatuslineModeNormal', { link = 'StatusLine' }) -- Modifies background of mode section in Normal
  set_default_hl('MiniStatuslineModeInsert', { link = 'StatusLine' }) -- Modifies background of mode section in Insert
  set_default_hl('MiniStatuslineModeVisual', { link = 'StatusLine' }) -- Modifies background of mode section in Visual
  set_default_hl('MiniStatuslineModeReplace', { link = 'StatusLine' }) -- Modifies background of mode section in Replace
  set_default_hl('MiniStatuslineModeCommand', { link = 'StatusLine' }) -- Modifies background of mode section in Command
  set_default_hl('MiniStatuslineModeOther', { link = 'StatusLine' }) -- Modifies background of mode section in Other modes

  set_default_hl('MiniStatuslineDevinfo', { link = 'StatusLine' }) -- Modifies background of dev info section (git, diff, diagnostics, lsp)
  set_default_hl('MiniStatuslineFilename', { link = 'StatusLine' }) -- Modifies background of filename section
  set_default_hl('MiniStatuslineFileinfo', { link = 'StatusLine' }) -- Modifies background of file info section
  set_default_hl('MiniStatuslineInactive', { link = 'StatusLine' }) -- Modifies background of inactive window statusline
end

setStatuslineColors()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.print 'Setting status line colors'
    setStatuslineColors()
  end,
})
