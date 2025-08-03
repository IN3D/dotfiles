local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Select all
keymap('n', 'vy', 'ggVG', opts)
-- Disable F1 and suspect
keymap({'i', 'n', 'v'}, '<F1>', '<nop>', opts)
-- Jump around larger amounts
keymap('n', '<C-j>', '15gjzz', opts)
keymap('n', '<C-k>', '15gkzz', opts)
keymap('v', '<C-j>', '15gjzz', opts)
keymap('v', '<C-k>', '15gkzz', opts)
-- Terminal escape
keymap('t', '<ESC>', '<C-\\><C-n>', opts)
keymap('t', '<C-[>', '<C-\\><C-n>', opts)
-- Emacs style insert mode mappings
keymap('i', '<C-b>', '<Left>', opts)
keymap('i', '<C-f>', '<Right>', opts)
keymap('i', '<C-a>', '<C-o>^', opts)
keymap('i', '<C-e>', '<C-o>$', opts)
keymap('i', '<C-n>', '<Down>', opts)
keymap('i', '<C-p>', '<Up>', opts)
-- Clear search highlighting
keymap('n', '<leader>/', ':nohls<CR>', opts)
-- FZF
keymap('n', '<leader>gf', ':GFiles<CR>')
keymap('n', '<leader>gF', ':GFiles?<CR>')
keymap('n', '<leader>ss', ':BLines<CR>')
keymap('n', '<leader>sgr', ':Rg<CR>')
keymap('n', '<leader>bb', ':Buffers<CR>')
