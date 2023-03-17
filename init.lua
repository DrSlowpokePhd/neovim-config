-- Jamie's Neovim Config
-- based on the https://github.com/nvim-lua/kickstart.nvim config
-- config split into 3 main files in the ./lua directory
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require('plugins')
require('options')
require('keybinds')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et

