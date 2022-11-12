local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

-- This is a very long line that should trigger the auto line breaking with easye. I would
-- prefer if it would trigger, as I simply hate long lines..




