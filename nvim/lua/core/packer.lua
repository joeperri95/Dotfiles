local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'
    -- Better language parsing
    use 'nvim-treesitter/nvim-treesitter'
    -- Motions from specific language features
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- Org mode in nvim
    use {'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup{}
        end
    }
    -- Pretty org mode
    use {
        'akinsho/org-bullets.nvim',
        config = function() require('org-bullets').setup() end
    }
    -- Colourschemes
    use 'dracula/vim'
    use {"catppuccin/nvim", as = "catppuccin"}
    -- Start screen and bookmark manager
    use 'mhinz/vim-startify'
    -- LSP manager
    use "williamboman/mason.nvim"
    -- Auto install LSP servers
    use "williamboman/mason-lspconfig.nvim"
    -- LSP defaults
    use "neovim/nvim-lspconfig"
    -- Fast navigation
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Icons
    use 'nvim-tree/nvim-web-devicons'
    -- Statusline
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- File browser
    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup({
            default_file_explorer=true
        }) end
    }
    -- Navigate between tmux panes
    use "christoomey/vim-tmux-navigator"

    -- The best plugin
    use "chaoren/vim-wordmotion"

    -- Mark alternative
    use 'ThePrimeagen/harpoon'

    -- Linting
    use "mfussenegger/nvim-lint"

    -- Debugging 
    use "mfussenegger/nvim-dap"

    -- Formatting 
    use "mhartington/formatter.nvim"

    -- Snippets engine
    use { 
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    } 
    -- Completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"

    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)
