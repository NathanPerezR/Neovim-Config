-- TODO: Consider removing (and its dependecies)

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',

  'https://github.com/nvim-neo-tree/neo-tree.nvim'
})


require('neo-tree').setup({
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
      position = 'right',
    },
  },
})


vim.keymap.set("n", "\\", "<Cmd>Neotree<CR>", { desc = 'NeoTree reveal', silent = true })
