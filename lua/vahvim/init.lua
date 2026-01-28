local plugins = {
  { 'nvim-lua/plenary.nvim' },

  { 'nvim-neotest/nvim-nio' },

  { 'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("vahvim.plugins.alpha-nvim")
    end,
  },

  { 'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = { 'hrsh7th/nvim-cmp', },
    config = function()
      require("vahvim.plugins.autopairs")
    end,
  },

  { 'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
        {
          'L3MON4D3/LuaSnip',
          version = 'v2.*',
          build = 'make install_jsregexp',
        },
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      require("vahvim.plugins.nvim-cmp")
    end,
  },

  { 'hrsh7th/cmp-cmdline',
    dependencies = {
      'hrsh7th/cmp-buffer'
    },
    config = function()
      require("vahvim.plugins.nvim-cmp-cmd")
    end,
  },

  { 'tpope/vim-sleuth' },

  { 'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
     },
    config = function()
      require("vahvim.plugins.telescope")
    end,
  },

  { 'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("vahvim.plugins.tree")
    end,
  },

  { 'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require("vahvim.plugins.treesitter")
    end,
  },

  { 'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
      require("vahvim.plugins.which-key")
    end,
  },

  { 'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<localleader>xd",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<localleader>xD",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<localleader>xs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<localleader>xl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<localleader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<localleader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    'folke/lazydev.nvim',
    ft = "lua",
    config = function()
      require("vahvim.plugins.lazydev")
    end,
  },

  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-orgmode/telescope-orgmode.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require("vahvim.plugins.nvim-org")
    end,
  },

  {
    'akinsho/org-bullets.nvim',
    config = function()
      require('org-bullets').setup()
    end
  },

  {
    'chipsenkbeil/org-roam.nvim',
    dependencies = {
      'nvim-orgmode/orgmode',
    },
    config = function()
      require("vahvim.plugins.org-roam")
    end,
  },

  {
    'sphamba/smear-cursor.nvim',
    opts={
      cursor_color = '#839bf3',
    },
    config = function()
      require("vahvim.plugins.nvim-cursor")
    end,
  },
  {
    'folke/flash.nvim',
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle Flash Search" },
    },
  },

  { 'lewis6991/gitsigns.nvim' },

  {
    'folke/zen-mode.nvim',
    opts = {},
    config = function()
      vim.keymap.set('n', '<leader>z', ':ZenMode<cr>', { desc = "toggle zenmode" })
    end,
  },

}

local lsp = {
  { 'williamboman/mason-lspconfig.nvim',
    dependencies = {
      { 'williamboman/mason.nvim',
      config = function()
        require("vahvim.lsp.mason")
      end,
      },
      { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require("vahvim.lsp.lsp-mason")
    end,
  },

  { 'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true },
      { 'folke/neodev.nvim', opts = {}, enabled = false },
    },
    config = function()
      require("vahvim.lsp.lspconfig")
    end,
  }
}

local dap = {
  { 'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require("vahvim.dap.nvim-dap-ui")
    end,
  },
  { 'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui'
    },
    config = function()
      require("vahvim.dap.nvim-dap")
    end,
  },
  {
    { 'mfussenegger/nvim-dap-python' },
  },
}

-- lazy
require("lazy").setup({
  spec = { { import = "vahvim.base.colorscheme" }, plugins, lsp, dap, },
  checker = {
      enabled = true,
      notify = false,
  },
  change_detection = { notify = false, },
})
