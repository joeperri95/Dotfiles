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

if vim.g.vscode then
  return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
else 
  return require('packer').startup(function(use)
    -- plugin manager
    use 'wbthomason/packer.nvim'
    -- better highlighting and more
    use 'nvim-treesitter/nvim-treesitter'
    -- colourscheme
    use 'dracula/vim'
    -- start screen and bookmark manager
    use 'mhinz/vim-startify'
    -- LSP manager
    use "williamboman/mason.nvim"
    -- Auto install LSP servers
    use "williamboman/mason-lspconfig.nvim"
    -- LSP defaults
    use "neovim/nvim-lspconfig"
    -- Linting
    use "mfussenegger/nvim-lint"
    -- Formatting 
    use "mhartington/formatter.nvim"
    -- Fast navigation
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- statusline
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- file browser
    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup({
            default_file_explorer=true
        }) end
    }
    -- snippets engine
    use { 
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    } 
    -- completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"

    -- The best plugin
    use "chaoren/vim-wordmotion"

    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)

end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
end)
