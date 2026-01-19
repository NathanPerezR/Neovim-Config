-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.debug',
  require 'plugins.telescope',
  require 'plugins.lspconfig',
  require 'plugins.cmp',
  require 'plugins.catppuccin',
  require 'plugins.todo-comments',
  require 'plugins.treesitter',
  require 'plugins.neoscroll',
  require '.plugins.indent-blank-line',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.vimtex',
  require 'plugins.roslyn'
--   require 'plugins.mini',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
