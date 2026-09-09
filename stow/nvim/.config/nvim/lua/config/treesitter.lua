require('nvim-treesitter').setup()

require('nvim-treesitter').install {
  'c',
  'cpp',
  'lua',
  'ruby',
  'dart',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'lua', 'ruby', 'dart' },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})
