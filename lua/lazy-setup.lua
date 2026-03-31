-- bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- get a list of plugins 
local plugins = {}
for _, f in ipairs(vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)) do
  local name = vim.fn.fnamemodify(f, ':t:r')
  local ok, spec = pcall(require, "plugins." .. name)
  if ok and type(spec) == "table" then
    table.insert(plugins, spec)
  elseif not ok then
    vim.notify("Failed to load plugin spec: " .. name .. "\n" .. spec, vim.log.levels.ERROR)
  end
end

-- load the plugins 
require('lazy').setup(plugins)

