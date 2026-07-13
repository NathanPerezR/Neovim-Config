return {
  cmd = { "fsautocomplete", "--background-service-enabled" },
  name = "fsautocomplete",
  filetypes = { "fsharp" },
  root_dir = vim.fs.dirname(
    vim.fs.find({ "*.fsproj", "*.sln", ".git" }, { upward = true })[1]
  ),
}
