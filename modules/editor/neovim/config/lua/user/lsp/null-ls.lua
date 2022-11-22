local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- ARTICLE: Use virtualenv for mypy
-- This manual python path setting is needed in order to mypy to find the virtualenv's
-- python executable..
-- The returned string has to be "stripped"
local current_python_path = vim.fn.system("which python"):sub(1, -2)

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" }}),
    diagnostics.flake8,
    diagnostics.mypy.with({ extra_args = { "--python-executable", current_python_path }}),
	},
})
