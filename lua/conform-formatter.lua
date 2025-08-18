---@module "lazy"
---@type LazySpec
local t = {

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      notify_no_formatters = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = false, cpp = true }
        return {
          timeout_ms = 2500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        c = { 'clang_format' },
        javascript = { 'prettier', 'biome', stop_after_first = true },
        typescript = { 'prettier', 'biome', stop_after_first = true },
        javascriptreact = { 'prettier', 'biome', stop_after_first = true },
        typescriptreact = { 'prettier', 'biome', stop_after_first = true },
        vue = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier', 'biome' },
        html = { 'prettier', 'htmlbeautifier', stop_after_first = true },
        xml = { 'xmlformatter' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        sh = { 'beautysh' },
        latex = { 'tex-fmt' },
        tex = { 'tex-fmt' },
      },
    },
  },
}

return t
