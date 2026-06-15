vim.pack.add({
  'https://github.com/mason-org/mason.nvim'
})

require('mason').setup({
  options = {
    ui = {
      icons = {
        package_installed = "✔",
        package_pending   = "➜",
        package_uninstalled = "✘",
      },
    },
  },
})

