local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.lspsaga"
require "user.lsp.neodev"
require "user.lsp.trouble"
require "user.lsp.todo"
require "user.lsp.emmet"
