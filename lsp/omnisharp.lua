return {
  cmd = { "OmniSharp",  '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
  name = "omnisharp",
  filetypes = { "cs"},
  root_dir = vim.fs.dirname(vim.fs.find({'.sln', '.csproj', '.git'}, { upward = true })[1]),
}

