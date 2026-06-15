vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})
require('catppuccin').setup({})-- dont need to call setup, defaults are fine
vim.cmd.colorscheme "catppuccin-nvim"

