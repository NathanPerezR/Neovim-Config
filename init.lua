if vim.fn.has("nvim-0.12") == 0 then
  vim.notify("Gotta be on 0.12+", vim.log.levels.ERROR)
  return
end

-- load the following files in the ./lua folder
require 'options' -- nvim options
require 'keymaps' -- non plugin key maps
require 'lsp-global' -- global lsp config (rest are loaded from lsp folder)

-- NOTE: plugins are loaded with vim.pack (default package manager)

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- NOTE: installing things with mason will not work on Nix, if the lsp is on path, it will attach

vim.filetype.add({
  extension = {
    gd = "gdscript",
  },
})

vim.lsp.enable({ "ts_ls", "vue_ls", "lua_ls", "gdscript", "omnisharp"})

