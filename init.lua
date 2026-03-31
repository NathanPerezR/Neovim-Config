if vim.fn.has("nvim-0.11") == 0 then
  vim.notify("Gotta be on 0.11+", vim.log.levels.ERROR)
  return
end

vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- load the following files in the ./lua folder
require 'options'
require 'lazy-setup'
require 'keymaps'


require('lualine').setup()

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- NOTE: installing things with mason will not work on Nix, if the lsp is on path, it will attach
vim.lsp.enable({ "ts_ls", "vue_ls", "lua_ls"})

