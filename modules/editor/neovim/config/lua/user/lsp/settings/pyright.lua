-- local path = require("lspconfig.util").path
--
-- local function get_hatch_dir()
--   return vim.fn.trim(vim.fn.system("hatch env find"))
-- end
--
-- local function get_python_dir(workspace)
--   local pythonproject_match = vim.fn.glob(path.join(workspace, "pythonproject.toml"))
--   if pythonproject_match ~= "" then
--     return get_hatch_dir()
--   end
--
--   return ""
-- end

return {
  settings = {

    python = {
      analysis = {
        -- typeCheckingMode = "strict",
        -- venvPath = "/Users/tibor/.virtualenvs",
        -- venv = "site",
      },
    },
  },
  -- on_new_config = function(new_config, new_root_dir)
  --   py.env(new_root_dir)
  --   new_config.settings.python.pythonPath = vim.fn.exepath("python")
  --   -- new_config.cmd_env.PATH = py.env(new_root_dir) .. new_config.cmd_env.PATH
  --   new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }
  -- end,
}
