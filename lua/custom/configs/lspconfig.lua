local stack = require "custom.stack"

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.config("pyright", {
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})

vim.lsp.config("ruff", {
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
})

vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.ansible" },
  root_markers = { ".git", "ansible.cfg", "pyproject.toml" },
  settings = {
    yaml = {
      keyOrdering = false,
      format = { enable = true },
      validate = true,
      schemaStore = {
        enable = true,
      },
    },
  },
})

vim.lsp.config("ansiblels", {
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible", "ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint", ".git" },
})

for _, server in ipairs(stack.lsp_servers) do
  vim.lsp.enable(server)
end
