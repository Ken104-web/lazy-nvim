-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath) 

vim.g.mapleader = " "


local plugins = {
    
 {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
     { "ellisonleao/gruvbox.nvim" },
     {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    ('thePrimeagen/harpoon'),
    ('mbbill/undotree'),
     ('tpope/vim-fugitive'),
     {
	    "VonHeikemen/lsp-zero.nvim",
	    branch = "v1.x",
	    dependencies = {
		    -- LSP Support
		    {"neovim/nvim-lspconfig"},
		    {"williamboman/mason.nvim"},
		    {"williamboman/mason-lspconfig.nvim"},

		    -- Autocompletion
		    {"hrsh7th/nvim-cmp"},
		    {"hrsh7th/cmp-buffer"},
		    {"hrsh7th/cmp-path"},
		    {"saadparwaiz1/cmp_luasnip"},
		    {"hrsh7th/cmp-nvim-lsp"},
		    {"hrsh7th/cmp-nvim-lua"},

		    -- Snippets
		    {"L3MON4D3/LuaSnip"},
		    {"rafamadriz/friendly-snippets"},
	    }
    },
     {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
     -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
     {
         'numToStr/Comment.nvim',
         opts = {
             -- add any options here
         }
     },

     {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- lazyional
        },
    },
    ('jose-elias-alvarez/null-ls.nvim'),


}
require("lazy").setup(plugins, {})

