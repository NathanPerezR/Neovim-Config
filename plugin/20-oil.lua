-- NOTE: g? for help in oil menu

vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/stevearc/oil.nvim"
})

require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon"
  },
  constrain_cursor = "editable",
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,    -- Show files and directories that start with ".", there is a way to make files hidden even if show hidden is true
    case_insensitive = true,
  },
})
