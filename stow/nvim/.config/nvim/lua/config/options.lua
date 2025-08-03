-- NOTE: This has all been cargo cult'd through several refactors and dates back
-- to my first `.vimrc` from like ..2013? Is any of it still relevant? encoding
-- and listchars probably. The rest of it.. debateable.
local opt = vim.opt

-- General Settings
opt.shell = 'bash'
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.autoindent = true
opt.smarttab = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.linebreak = true
opt.background = 'dark'
opt.termguicolors = true

-- Sane backspace
opt.backspace = { 'indent', 'eol', 'start' }

-- Remove beeping
opt.visualbell = false
opt.errorbells = false

-- UTF-8 Support
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.listchars = {
  tab = '▸ ',
  eol = '¬',
  trail = '⋅',
  extends = '❯',
  precedes = '❮'
}
opt.showbreak = '↪'
