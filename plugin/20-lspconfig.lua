vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
})

vim.lsp.config('fsautocomplete', {
  cmd = { 'fsautocomplete', '--adaptive-lsp-server-enabled' },
  filetypes = { 'fsharp' },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  settings = {
    FSharp = {
      keywordsAutocomplete = true,
      ExternalAutocomplete = false,
      Linter = true,
      UnionCaseStubGeneration = true,
      UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
      RecordStubGeneration = true,
      RecordStubGenerationBody = 'failwith "Not Implemented"',
      InterfaceStubGeneration = true,
      InterfaceStubGenerationObjectIdentifier = 'this',
      InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
      UnusedOpensAnalyzer = true,
      UnusedDeclarationsAnalyzer = true,
      UseSdkScripts = true,
      SimplifyNameAnalyzer = true,
      ResolveNamespaces = true,
      EnableReferenceCodeLens = true,
    },
  },
})

vim.lsp.enable('fsautocomplete')
