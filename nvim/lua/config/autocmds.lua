local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Example autocommands
local general = augroup('General', { clear = true })

autocmd('FileType', {
  group = general,
  pattern = { 'help', 'man' },
  callback = function ()
    vim.keymap.set('n', 'q', ':q<CR>', { buffer = true })
  end
})

