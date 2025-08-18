vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.tabstop = 3
vim.g.shiftwidth = 3
vim.g.softtabstop = 3
vim.g.expandtab = true
vim.g.editorconfig = false
vim.o.shiftwidth = 3

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

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
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
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars:append { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>t', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

-- Normal mode mappings (reverse)
vim.api.nvim_set_keymap('n', 'Ğ', '[', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Ü', ']', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ğ', '{', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ü', '}', { noremap = true, silent = true })

-- Insert mode mappings (reverse)
-- vim.api.nvim_set_keymap('i', 'Ğ', '[', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', 'Ü', ']', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', 'ğ', '{', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', 'ü', '}', { noremap = true, silent = true })

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

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_user_command('LspLogClear', function()
  local lsplogpath = vim.fn.stdpath 'state' .. '/lsp.log'
  print(lsplogpath)
  if io.close(io.open(lsplogpath, 'w+b')) == false then
    vim.notify('Clearning LSP Log failed.', vim.log.levels.WARN)
  end
end, { nargs = 0 })

require('lazy').setup {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  require 'conform-formatter',
  require 'lsp-configs',
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').add {
        { '<leader>b', group = '[B]ufferline' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>o', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      }
    end,
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags

      require('telescope').setup {
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  { -- Multiple Cursor plugin
    'brenton-leighton/multiple-cursors.nvim',
    version = '*', -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
      { '<C-n>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'x' }, desc = 'Add cursor and move down' },
      { '<C-m>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'x' }, desc = 'Add cursor and move up' },

      { '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'i', 'x' }, desc = 'Add cursor and move up' },
      { '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'i', 'x' }, desc = 'Add cursor and move down' },

      { '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', mode = { 'n', 'i' }, desc = 'Add or remove cursor' },

      { '<Leader>a', '<Cmd>MultipleCursorsAddMatches<CR>', mode = { 'n', 'x' }, desc = 'Add cursors to cword' },
      { '<Leader>A', '<Cmd>MultipleCursorsAddMatchesV<CR>', mode = { 'n', 'x' }, desc = 'Add cursors to cword in previous area' },

      { '<Leader>d', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', mode = { 'n', 'x' }, desc = 'Add cursor and jump to next cword' },
      { '<Leader>D', '<Cmd>MultipleCursorsJumpNextMatch<CR>', mode = { 'n', 'x' }, desc = 'Jump to next cword' },

      { '<Leader>l', '<Cmd>MultipleCursorsLock<CR>', mode = { 'n', 'x' }, desc = 'Lock virtual cursors' },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      { '3rd/image.nvim', opts = {} },
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree reveal right<CR>', { desc = 'NeoTree reveal' } },
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['P'] = {
              'toggle_preview',
              config = {
                use_float = false,
                use_image_nvim = true,
                title = 'Preview',
              },
            },
            ['\\'] = 'close_window',
            ['<tab>'] = 'toggle_node',
          },
        },
        commands = {
          -- open_in_new_tab = function(state)
          --   local node = state.tree:get_node()
          --   if node.type == 'file' then
          --     vim.cmd('tabnew ' .. node.path)
          --   end
          -- end,
        },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    },
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers',
          diagnostics = 'coc',
          numbers = 'none',
          modified_icon = '●',
          color_icons = false,
          tab_size = 0,
          show_buffer_close_icons = false,
          get_element_icon = function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
          end,
          style_preset = {
            bufferline.style_preset.minimal,
            bufferline.style_preset.no_italic,
          },
          hover = {
            enabled = false,
          },
          window = {
            position = 'left',
          },
          offsets = {
            {
              filetype = 'neo-tree',
              separator = true,
              text = function()
                local pwd = vim.loop.cwd()
                -- Use fnamemodify to get the path relative to the user's home directory (~)
                local modified_pwd = vim.fn.fnamemodify(pwd, ':~')
                return modified_pwd
              end,
              padding = 0,
            },
          },
        },
      }

      vim.keymap.set('n', '<leader>w', function()
        local bufnr = vim.fn.bufnr()
        vim.cmd 'BufferLineCycleNext'
        vim.cmd('bwipeout! ' .. bufnr)
      end, { desc = 'Close current buffer and go to next available buffer or file explorer' })

      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          per_filetype = {
            codecompanion = { 'codecompanion' },
          },
        },
      }
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    init = function()
      local theme1 = 'forestbones'
      local theme2 = 'rosebones'
      local is_theme1_active = false

      vim.cmd.colorscheme(theme2)
      vim.cmd.set 'background=light'
      local function toggle_theme()
        if is_theme1_active then
          vim.cmd.colorscheme(theme2)
          vim.cmd.set 'background=light'
        else
          vim.cmd.colorscheme(theme1)
          vim.cmd.set 'background=dark'
        end
        is_theme1_active = not is_theme1_active
        print('Switched to: ' .. (is_theme1_active and theme1 or theme2))
      end

      vim.keymap.set('n', 'zt', toggle_theme, { desc = 'Toggle Zenbones Theme' })
    end,
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },

  {
    'dylancetin/mini.statusline',
    -- dir = '~/.config/nvim/lua/modules/statusline',
    priority = 1000, -- Set high priority to ensure it loads first
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      context_commentstring = {
        config = {
          javascript = {
            __default = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            jsx_attribute = '// %s',
            comment = '// %s',
          },
          typescript = { __default = '// %s', __multiline = '/* %s */' },
        },
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.indent_line',
}

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

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function(data)
    -- check if the provided file is a directory
    if vim.fn.isdirectory(data.file) ~= 1 then
      return
    end

    -- change Neovim's working directory
    vim.cmd.cd(data.file)

    -- open neo-tree on the right side (non-floating)
    require('neo-tree.command').execute {
      toggle = true,
      dir = data.file,
      position = 'right', -- use position instead of side
    }
  end,
})

setStatuslineColors()
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = setStatuslineColors,
})

vim.cmd 'command! Qa qa'

require 'custom.copy-visual-as-codeblock'
require 'custom.bun'
