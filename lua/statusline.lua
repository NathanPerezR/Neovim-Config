-- helpers

-- check if current buffer is in a Git repo
local function is_git_repo()
  return vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):gsub("\n","") == "true"
end

local function git_root()
  local file_dir = vim.fn.expand("%:p:h")  -- directory of current file
  if file_dir == "" then return "" end
  local ok, root = pcall(vim.fn.system, "cd " .. vim.fn.shellescape(file_dir) .. " && git rev-parse --show-toplevel 2>/dev/null")
  if not ok then return "" end
  root = root:gsub("\n","")
  return root ~= "" and vim.fn.fnamemodify(root, ":t") or ""
end

-- get current Git branch
local function git_branch()
  if not is_git_repo() then return "" end
  return vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n","")
end

-- show diagnostics counts
local function diagnostics_section()
  local icons = {Error="", Warn="", Hint="", Info=""}
  local parts = {}
  for _, sev in ipairs({"Error","Warn","Hint","Info"}) do
    local count = #vim.diagnostic.get(0, {severity = sev})
    if count > 0 then
      table.insert(parts, string.format("%d %s", count, icons[sev]))
    end
  end
  return #parts > 0 and " " .. table.concat(parts, " ") or ""
end

-- show current editing mode
local function mode_section()
  local mode_map = {
    n = "NORMAL",
    no = "N·OPERATOR",
    i = "INSERT",
    ic = "INSERT",
    v = "VISUAL",
    V = "V·LINE",
    [""] = "V·BLOCK",
    c = "COMMAND",
    cv = "VIM EX",
    ce = "EX",
    r = "REPLACE",
    R = "REPLACE",
    rm = "REPLACE",
    s = "SELECT",
    S = "S·LINE",
    [""] = "S·BLOCK",
    t = "TERMINAL"
  }
  local m = vim.fn.mode()
  return mode_map[m] and (" " .. mode_map[m]) or (" " .. m)
end

-- show a symbol if there are unsaved buffers
local function unsaved_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= vim.api.nvim_get_current_buf() and vim.api.nvim_buf_get_option(buf, "modified") then
      return " ○"
    end
  end
  return ""
end

-- file name, icon, and attributes
local function file_section()
  local name = vim.fn.expand "%:t"
  if name == "" then name = "No Name" end

  local attr = vim.bo.modified and "●" or (vim.bo.readonly and "󰌾" or "")
  local ok, devicons = pcall(require, "nvim-web-devicons")
  local icon = ok and devicons.get_icon("", vim.fn.expand "%:e", {default = true}) or ""
  
  return string.format("%s %s%s", icon, name, attr ~= "" and " " .. attr or "")
end

-- Git repository info
local function git_section()
  local repo = git_root()
  local branch = git_branch()
  if repo ~= "" and branch ~= "" then
    return string.format(" %s:%s", repo, branch)
  elseif branch ~= "" then
    return " " .. branch
  else
    return ""
  end
end

-- left side of statusline
local function left_section()
  return file_section() .. unsaved_buffers() .. diagnostics_section() .. git_section()
end

-- right side of statusline
local function right_section()
  return mode_section() .. " " .. "%l:%L"
end

-- main statusline function
_G.set_statusline = function()
  return " " .. left_section() .. "%=" .. right_section() .. " "
end

-- autocmds to update statusline dynamically
local group = vim.api.nvim_create_augroup("StatusLine", { clear = true })

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
  group = group,
  callback = function()
    vim.cmd("setlocal statusline=%!v:lua.set_statusline()")
  end,
})

vim.api.nvim_create_autocmd({"DiagnosticChanged", "BufWinEnter"}, {
  group = group,
  callback = function()
    vim.cmd("setlocal statusline=%!v:lua.set_statusline()")
  end,
})
