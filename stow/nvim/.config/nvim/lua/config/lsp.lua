local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({
  PATH='prepend'
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
  },
  automatic_installation = {
    exclude = { 'solargraph' } -- see below
  }
})

local function get_solargraph_cmd()
  -- 1: check if it's on the path. Ideally it's been put on $PATH by direnv
  -- or similar
  local path_solargraph = vim.fn.exepath('solargraph')
  if path_solargraph ~= '' then
    return { path_solargraph, "stdio" }
  end

  -- 2: fallback on trying to call it directly with bundle
  local handle = io.popen('bundle exec which solargraph 2>/dev/null')
  if handle then
    local bundle_result = handle:read('*a'):gsub('%s+$', '')
    handle:close()

    if bundle_result and bundle_result ~= '' then
      -- If bundle exec finds solargraph, use bundle exec directly
      return { 'bundle', 'exec', 'solargraph', 'stdio' }
    end
  end
end

-- Get the appropriate solargraph command
local solargraph_cmd = get_solargraph_cmd()

-- Only setup solargraph if we found a valid command
if solargraph_cmd then
  vim.notify("Solargraph LSP found", vim.log.levels.INFO)
  lspconfig.solargraph.setup({
    cmd = solargraph_cmd,
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

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        float = {
          border = 'single',
          source = 'always',
          header = '',
          prefix = '',
          focusable = false
        },
      })

      -- Set keymaps
      local opts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      -- Show diagnostics in floating window
      vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, opts)
      -- navigate between diagnostics
      vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist, opts)
    end
  })
else
  -- Log a warning if solargraph wasn't found
  vim.notify("Solargraph LSP not found - Ruby LSP features disabled", vim.log.levels.WARN)
end

