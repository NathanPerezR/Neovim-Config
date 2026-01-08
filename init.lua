vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- options
require"options"
-- keymaps 
require"keymaps"
-- load the lazy package manager
require"lazy-bootstrap"
-- load the plugins 
require"lazy-plugins"
