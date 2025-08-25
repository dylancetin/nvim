vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.tabstop = 3
vim.g.shiftwidth = 3
vim.g.softtabstop = 3
vim.g.expandtab = true
vim.g.editorconfig = false
vim.o.shiftwidth = 3
vim.o.tabstop = 3
vim.o.softtabstop = 3

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = 'screen'

-- Map the function to a key
vim.keymap.set('n', '<leader>cc', function()
  for _ = 0, 90 do
    vim.cmd 'normal o'
  end
  vim.cmd 'normal v90kgcc'
  vim.cmd 'normal 90j'
end, { desc = 'Insert 90 // lines' })
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars:append { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Tab management keymaps
vim.keymap.set('n', '<C-T>', ':tabnew<CR>', { desc = 'Open new tab', noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', ':term<CR>', { desc = 'New Terminal Buffer', noremap = true, silent = true })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move cursor by words with Alt + Arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<A-Left>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', 'w', { noremap = true, silent = true })

-- Move cursor by words with Alt + Arrow keys in insert mode
vim.api.nvim_set_keymap('i', '<A-Left>', '<C-o>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Right>', '<C-o>w', { noremap = true, silent = true })

-- Move cursor by words with Alt + Arrow keys in visual mode
vim.api.nvim_set_keymap('v', '<A-Left>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Right>', 'w', { noremap = true, silent = true })

-- Map [q to :cprev and ]q to :cnext in normal mode
vim.api.nvim_set_keymap('n', '[q', ':cprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', { noremap = true, silent = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd 'command! Qa qa'
