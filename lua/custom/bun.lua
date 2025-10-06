-- Bunx: open a terminal split and run `bun run <target> [args...]`
-- Usage:
--   :Bun               -> bun run <current file>
--   :Bun dev           -> bun run dev (package.json script)
--   :Bun % --watch     -> bun run <current file> --watch
--   :Bun path/to.ts    -> bun run path/to.ts

local function project_root()
  -- Try to detect project root (needs Neovim 0.9+ for vim.fs.*)
  local buf_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h')
  local root = vim.fs.find({ 'bun.lockb', 'package.json', 'package.jsonc', '.git' }, { upward = true, path = buf_dir })[1]
  if root then
    local dir = vim.fs.dirname(root)
    return dir
  end
  return vim.fn.getcwd()
end

local term_buf = nil

local function open_term_and_run(cmd, cwd)
  local shell_cmd = table.concat(cmd, ' ') .. '; exec $SHELL'

  -- Check if we have an existing valid terminal buffer
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- Find the window with this buffer, or create a new window
    local wins = vim.fn.win_findbuf(term_buf)
    if #wins > 0 then
      -- Buffer is already visible, switch to that window
      vim.api.nvim_set_current_win(wins[1])
    else
      -- Buffer exists but not visible, create a split and show it
      vim.cmd 'botright split'
      vim.cmd 'resize 40'
      vim.api.nvim_set_current_buf(term_buf)
    end

    -- Send the new command to the existing terminal
    vim.api.nvim_chan_send(vim.bo[term_buf].channel, shell_cmd .. '\n')
  else
    -- Create a new terminal buffer
    vim.cmd 'botright split'
    vim.cmd 'resize 40'
    term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(term_buf)

    vim.fn.termopen(shell_cmd, { cwd = cwd })

    -- Optional: mark buffer as unlisted
    vim.bo[term_buf].buflisted = false
  end
  vim.cmd 'normal! G'
end

vim.api.nvim_create_user_command('Bun', function(opts)
  -- If user provided args, use them; otherwise use current file
  local args = vim.deepcopy(opts.fargs or {})

  if #args == 0 then
    -- Save current buffer if modified before running
    if vim.bo.modified then
      vim.cmd 'write'
    end
    local file = vim.fn.expand '%:p'
    if file == '' then
      vim.notify('Bunx: no current file to run', vim.log.levels.ERROR)
      return
    end
    table.insert(args, file)
  else
    -- Allow '%' to mean current file
    for i, a in ipairs(args) do
      if a == '%' then
        args[i] = vim.fn.expand '%:p'
      end
    end
  end

  local cmd = { 'bun', 'run' }
  vim.list_extend(cmd, args)

  open_term_and_run(cmd, project_root())
end, {
  nargs = '*',
  complete = 'file', -- basic file completion (still works fine for scripts if you type them)
  desc = 'Open a terminal and run `bun run` for the current file or provided args',
})
