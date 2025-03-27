-- vim: fdm=marker:
-- ============================================================================
-- Who: Eric Hopkins <eric.on.tech@gmail.com>
-- What: Vim configuration, main file
-- Version: 4.0
-- ============================================================================

require('config.options')
require('config.keymaps')
require('config.plugins')
require('config.autocmds')
require('config.lsp')
require('config.treesitter')
require('config.completion')
require('config.filetype_keymaps')

vim.cmd.colorscheme('gruvbox')
