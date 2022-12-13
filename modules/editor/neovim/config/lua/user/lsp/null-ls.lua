local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" }}),
    diagnostics.flake8,
}

-- ARTICLE: For some projects (like any wagtail based project) there is no point to use
-- mypy because of the interleaved typed django code and the non-typed wagtail code. With
-- the mix of the two, there is no sane ignoring that can be applied unfortunately.. The
-- only solution for this is to turn off the whole mypy diagnostic source in neovim. I
-- used a special file for this.
-- For example for this code sample, the mypy diagnostics would report that the c field
-- needs a type annotation, however the django-stubs package provides types for the model
-- fields. The issue here is that the model was inherited from the wagtail related "Page"
-- class and not from the "models.Model" class which would be okay in terms of the
-- django-stubs type injections. And also, since wagtail isn't typed the "Page" would be
-- the type of "Any" in this case, which would always emit an error.
-- ┆ 1   from wagtail.models import Page                                                                                         •
-- ┆   1 from django.db import models
-- ┆   2
-- ┆   3
--    4 class HomePage(Page):     ■■ Base type Page becomes "Any" due to an unfollowed import                                   =
-- ┆   5 ▏   parent_page_types = ["wagtailcore.Page"]
-- ┆   6 ▏   max_count = 1
--    7 ▏   c = models.CharField()     ■ Need type annotation for "c"                                                           -

-- If there is no mypy entry in the control file, or the control file does not exist, we
-- won't include the mypy source to the null-ls sources. The status of the command would
-- be 0 if the file exists and mypy is listed in there.
vim.fn.system("grep -qs 'mypy' .null-ls-ignore-sources")
if vim.v.shell_error ~= 0
then
  -- ARTICLE: Use virtualenv for mypy
  -- This manual python path setting is needed in order to mypy to find the virtualenv's
  -- python executable..
  -- The returned string has to be "stripped" in a manual way..
  local current_python_path = vim.fn.system("which python"):sub(1, -2)
  -- ARTICLE: mypy config in a django project with https://github.com/typeddjango/django-stubs
  -- The key was here to remove the mypy version that was installed with Mason
  table.insert(sources, diagnostics.mypy.with({
    extra_args = { "--python-executable", current_python_path },
  }))
end

null_ls.setup({
	debug = false,
	sources = sources,
})
