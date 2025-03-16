local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({
  PATH='prepend',
  -- Add rbenv shims to Mason's PATH
  env = {
    -- NOTE: how will this if the directory doesn't exist?
    PATH = vim.fn.expand("$HOME/.rbenv/shims:") .. vim.env.PATH,
  },
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
  },
  -- automatic_installation = {
  --   exclude = { 'solargraph' }
  -- }
})
