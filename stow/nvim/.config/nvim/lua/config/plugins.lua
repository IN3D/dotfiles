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
  -- AI
  {
    "nomnivore/ollama.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    keys = {
      {
        "<leader>ap",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
      },
    },
    --@type Ollama.Config
    opts = {
      model = "qwen2.5-coder:1.5b",
      url = "http://127.0.0.1:11434",
      -- Skip this, handled by systemd
      -- serve = {
      --   on_start = false,
      --   command = "ollama",
      --   args = { "serve" },
      --   stop_command = "pkill",
      --   stop_args = { "-SIGTERM", "ollama" },
      -- }
    }
  },
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
