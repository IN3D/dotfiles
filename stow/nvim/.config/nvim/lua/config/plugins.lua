local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Enable LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  },
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
    }
  },
  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
    }
  },
  -- Git
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  -- TPope
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  'tpope/vim-eunuch',
  'tpope/vim-endwise',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  -- Utility
  'jiangmiao/auto-pairs',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },
  -- Theme
  'morhetz/gruvbox'
})
