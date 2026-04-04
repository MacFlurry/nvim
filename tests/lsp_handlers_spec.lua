local function fail(msg)
  io.stderr:write(msg .. "\n")
  os.exit(1)
end

-- Mock base46_cache pour éviter l'erreur de chargement
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- Créer un faux fichier pour dofile s'il n'existe pas
local lsp_cache = vim.g.base46_cache .. "lsp"
if vim.fn.filereadable(lsp_cache) == 0 then
  vim.fn.mkdir(vim.g.base46_cache, "p")
  local f = io.open(lsp_cache, "w")
  f:write("")
  f:close()
end

-- Charger la configuration LSP
local lspconfig = require("plugins.configs.lspconfig")

local function assert_type(val, expected, msg)
  if type(val) ~= expected then
    fail(msg .. " (expected " .. expected .. ", got " .. type(val) .. ")")
  end
end

-- 1. Vérifier que les handlers sont bien des fonctions (et non des nil ou des tables cassées)
assert_type(vim.lsp.handlers["textDocument/hover"], "function", "Hover handler should be a function")
assert_type(vim.lsp.handlers["textDocument/signatureHelp"], "function", "SignatureHelp handler should be a function")

-- 2. Mocking pour vérifier l'injection des options (TDD style)
local original_hover = vim.lsp.handlers.hover
local captured_config = nil

-- On remplace temporairement le handler de base pour capturer la config passée
vim.lsp.handlers.hover = function(err, result, ctx, config)
  captured_config = config
end

-- Appeler notre handler
vim.lsp.handlers["textDocument/hover"](nil, {}, {}, {})

-- Vérifier si la bordure "single" a été injectée
if not captured_config or captured_config.border ~= "single" then
  fail("Hover handler failed to inject 'single' border. Got: " .. vim.inspect(captured_config))
end

-- Restaurer
vim.lsp.handlers.hover = original_hover

-- 3. Même chose pour signatureHelp
local original_sig = vim.lsp.handlers.signature_help
captured_config = nil

vim.lsp.handlers.signature_help = function(err, result, ctx, config)
  captured_config = config
end

vim.lsp.handlers["textDocument/signatureHelp"](nil, {}, {}, {})

if not captured_config or captured_config.border ~= "single" or captured_config.focusable ~= false then
  fail("SignatureHelp handler failed to inject correct options. Got: " .. vim.inspect(captured_config))
end

vim.lsp.handlers.signature_help = original_sig

-- Nettoyage des mocks (optionnel selon vos besoins de cache)
-- os.remove(lsp_cache)

print("lsp_handlers_spec: OK (No regressions found)")
