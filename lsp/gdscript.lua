return {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
  filetypes = { "gdscript" },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "project.godot" })
    if root then
      on_dir(root)
    end
  end,
}

-- The bellow script needs to be located somewhere
-- #!/bin/sh
-- # ~/home/nathan/Repositories/Tiny-Games/godot-nvim.sh
-- nvim --server /tmp/nvim.pipe --remote-send ":edit +${2} ${1}<CR>"
--
-- # Obv give this file perms with chmod +x ./godot-nvim.sh
--
-- # start nvim with 
-- # nvim --listen /tmp/nvim.pipe
--
-- # Godot needs to have exec path set to this script
-- # Exec flags: {file} {line}
-- # Use external editor: on
