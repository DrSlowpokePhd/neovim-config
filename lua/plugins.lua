-------------
-- Plugins --
-------------
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                         -- Package manager
  use 'tpope/vim-fugitive'                                                             -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                              -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                          -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                                -- Highlight, edit, and navigate code
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                                          -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                                        -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath
  use {'ms-jpq/coq_nvim', branch = 'coq'}
    -- use { 'yioneko/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                    -- Autocompletion
  use { 'L3MON4D3/LuaSnip' --[[, requires = { 'saadparwaiz1/cmp_luasnip' }]] }                -- Snippet Engine and Snippet Expansion
  use 'mjlbach/onedark.nvim'                                                           -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'                                                      -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim'                                            -- Add indentation guides even on blank lines
  use 'echasnovski/mini.nvim'                                                          -- Seriously tiny neovim plugins
  use 'uga-rosa/ccc.nvim'                                                              -- Super powerful color picker / colorizer plugin.
  use 'sainnhe/gruvbox-material'                                                       -- Gruvbox modification with softer contrast and Tree-sitter support.
  use { 'willothy/nvim-cokeline', requires = 'kyazdani42/nvim-web-devicons' }             -- A Tabline for people with addictive personalities
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }          -- file tree, better than NERDTree, smaller than CHADTree
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }                 -- DAP (Debug Adapter Protocol) support for neovim
  use 'is0n/jaq-nvim'                                                                  -- Just Another Quickrun Plugin
  use 'motosir/skel-nvim'                                                              -- Neovim Skeleton Plugin

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
