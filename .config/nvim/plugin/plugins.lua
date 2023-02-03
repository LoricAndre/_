local plugins_spec = {
  ['nvim-telescope/telescope.nvim'] = {
    requires = {
      'nvim-lua/popup.nvim', { 'nvim-lua/plenary.nvim', opt = false },
      'nvim-telescope/telescope-media-files.nvim',
      'cljoly/telescope-repo.nvim',
      'gbrlsnchs/telescope-lsp-handlers.nvim', 'rcarriga/nvim-notify',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
  },
  ['ms-jpq/coq_nvim'] = {
    branch = 'coq',
    requires = {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p' }
    },
    run = ':COQdeps',
  },
  ['feline-nvim/feline.nvim'] = {
    requires = { 'kyazdani42/nvim-web-devicons', 'lewis6991/gitsigns.nvim' }
  },
  ['nvim-treesitter/nvim-treesitter'] = {
    run = ':TSUpdate',
    event = 'BufRead'
  },
  ['michaelb/sniprun'] = {
    run = 'bash ./install.sh'
  },
  ['williamboman/mason.nvim'] = {
    requires = {
      'neovim/nvim-lspconfig', 'jubnzv/virtual-types.nvim',
      'kosayoda/nvim-lightbulb',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      'ThePrimeagen/refactoring.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim', 'jayp0521/mason-null-ls.nvim',
      'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap', "jayp0521/mason-nvim-dap.nvim",
    },
    after = 'coq_nvim' -- required for auto start to work
  },
  'catppuccin/nvim', 'RRethy/nvim-base16',
  'lewis6991/impatient.nvim', 'ggandor/lightspeed.nvim',
  'shaunsingh/nord.nvim', 'tiagovla/tokyodark.nvim',
  'folke/tokyonight.nvim',
  'shaunsingh/seoul256.nvim', 'nekonako/xresources-nvim',
  'akinsho/toggleterm.nvim', 'numToStr/Comment.nvim',
  'lukas-reineke/indent-blankline.nvim',
}
return require 'utils'.pack(plugins_spec)
