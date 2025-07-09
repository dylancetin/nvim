local function copy_visual_as_codeblock()
  -- exit visual mode to fix marks
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)

  -- get visual‐start and visual‐end positions
  local s_pos = vim.fn.getpos "'<"
  local e_pos = vim.fn.getpos "'>"
  local s_row, s_col = s_pos[2], s_pos[3]
  local e_row, e_col = e_pos[2], e_pos[3]

  -- fetch the lines in the range [s_row,e_row]
  local lines = vim.api.nvim_buf_get_lines(0, s_row - 1, e_row, false)
  if #lines == 0 then
    return
  end

  -- trim first and last line if necessary (charwise selection)
  if #lines == 1 then
    lines[1] = string.sub(lines[1], s_col, e_col)
  else
    lines[1] = string.sub(lines[1], s_col)
    lines[#lines] = string.sub(lines[#lines], 1, e_col)
  end

  -- join into one string
  local text = table.concat(lines, '\n')

  -- get current filename (tail) e.g. "foo.lua"
  local fname = vim.fn.expand '%:t'
  if fname == '' then
    fname = 'file' -- fallback if no name
  end

  -- build the fenced block
  local fence = '```' .. fname
  local block = fence .. '\n' .. text .. '\n' .. '```'

  -- yank to + (system) and " (unnamed)
  vim.fn.setreg('+', block)
  vim.fn.setreg('"', block)

  vim.notify('Copied code block to clipboard with filename: ' .. fname, vim.log.levels.INFO)
end

-- map in visual mode: <Leader>c
vim.keymap.set('v', 'm', copy_visual_as_codeblock, { desc = 'Copy selection as ```filename.ext``` code block' })
