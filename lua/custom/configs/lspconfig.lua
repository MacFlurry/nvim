local lsp_defaults = require "plugins.configs.lspconfig"
local on_attach = lsp_defaults.on_attach
local capabilities = lsp_defaults.capabilities

local util = require "lspconfig.util"

vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

vim.lsp.config("ruff", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})
