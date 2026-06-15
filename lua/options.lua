vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true -- Enable break indent

vim.opt.undofile = true -- Save undo history

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default

vim.opt.updatetime = 250 -- Decrease update time

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true -- display white space
vim.opt.listchars = { -- select the whitespace chars
  tab = '» ',
  nbsp = '␣',
  trail = '·', -- trailing spaces
  lead = '·', -- leading spaces
  space = ' ' -- non trailing non leading spaces
}

vim.opt.inccommand = 'split' -- Preview substitutions live

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.scrolloff = 15 -- Minimal number of screen lines to keep above and below the cursor.

vim.opt.expandtab = true -- convert tab into spaces
vim.opt.autoindent = true -- copies inden from prev line
vim.opt.tabstop = 2 -- how many spaces tab generates
vim.opt.softtabstop = 2 -- 
vim.opt.shiftwidth = 2 -- how many tabs are done by << >> and ==
