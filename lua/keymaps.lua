-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TODO: terminal mode commands 

-- Keybinds to make split navigation easier.

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- TODO: Some terminals have colliding keymaps or are not able to send distinct keycodes, need to fix that to make it possible to move windows around 

-- TODO: Need to make commands for working with tabs  

-- Highlight when yanking (copying) text

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- spell
vim.keymap.set("n", "<Leader>Se", ":setlocal spell spelllang=en_us<CR>", { desc = "Enable spellcheck (English)" })
vim.keymap.set("n", "<Leader>Sd", ":setlocal nospell<CR>", { desc = "Disable spellcheck" })
