local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Reloads neovim whenever the plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call to prevent erroring out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- packer.nvim self-care
  use "wbthomason/packer.nvim"

  -- Core
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "vimwiki/vimwiki"         -- Vim Wiki

  -- Autocompletion
  use "hrsh7th/nvim-cmp"        -- Completion engine plugin for Neovim written in Lua
  use "hrsh7th/cmp-buffer"      -- Buffer completions
  use "hrsh7th/cmp-path"        -- Path completions
  use "hrsh7th/cmp-cmdline"     -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"    -- LSP completion source for nvim-cmp

  -- Snippets
  use "L3MON4D3/LuaSnip"                -- Snippet engine plugin for Neovim written in Lua
  use "saadparwaiz1/cmp_luasnip"        -- luasnip completion source for nvim-cmp
  use "rafamadriz/friendly-snippets"    -- Collection of snippets for different programming languages
  
  -- LSP
  use "neovim/nvim-lspconfig"             -- Collection of configurations for the built-in LSP client
  -- use "williamboman/nvim-lsp-installer"   -- Easy-to-use language server installer
  use "williamboman/mason.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "BurntSushi/ripgrep"                -- Required for `live_grep` and `grep_string` in Telescope
  use "jose-elias-alvarez/null-ls.nvim"   -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  }

  -- Appearance
  use "kyazdani42/nvim-web-devicons"
  use "folke/tokyonight.nvim"
  use "overcache/NeoSolarized"
  use "onsails/lspkind-nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
