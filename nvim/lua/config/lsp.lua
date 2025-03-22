local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({
  PATH='prepend',
  env = {
    -- Add rbenv shims to Mason's PATH
    -- NOTE: how will this behave if the directory doesn't exist?
    PATH = vim.fn.expand("$HOME/.rbenv/shims:") .. vim.env.PATH,
  },
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
  },
  automatic_installation = {
    exclude = { 'solargraph' } -- handled by rbenv
  }
})

-- For Ruby
-- Alternate command tests
-- cmd = { vim.fn.expand("/home/eric/Projects/pkm-ruby-poc/vendor/bundle/ruby/3.3.0/bin/solargraph"), "stdio" },
-- cmd = { vim.fn.expand("/usr/lib/ruby/gems/3.3.0/bin/solargraph"), "stdio" },
lspconfig.solargraph.setup({
  cmd = { vim.fn.expand("$HOME/.rbenv/shims/solargraph"), "stdio" },
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      flags = {
        debounce_text_changes = 150,
      },
      formatting = true,
    }
  },
  on_attach = function(client, bufnr)
    -- Enable formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end

    -- Set keymaps
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end
})
