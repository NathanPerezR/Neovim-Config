-- F1 for help while in menu

vim.pack.add({
  "nvim-tree/nvim-web-devicons",
  "https://github.com/ibhagwan/fzf-lua",
})

require('fzf-lua').setup({
})

-- some keymaps 

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>sf', function() fzf.files() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', function() fzf.buffers() end, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sg', function() fzf.live_grep() end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sh', function() fzf.helptags() end, { desc = '[S]earch [H]elp' })

-- TODO: go through LSP actions and see if there are more to do
vim.keymap.set('n', '<leader>sll', function() fzf.helptags() end, { desc = '[S]earch [L]sp - [L]ive Workplace symbols' })

vim.keymap.set('n', '<leader>sr', function() fzf.resume() end, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>sw', function() fzf.grep_cword() end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>s/', function() fzf.lgrep_curbuf() end, { desc = '[S]earch [/] in current buffer' })

vim.keymap.set('n', '<leader>sgb', function() fzf.git_branches() end, { desc = '[S]earch [G]it [B]ranches' })
