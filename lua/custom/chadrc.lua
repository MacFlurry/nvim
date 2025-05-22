vim.opt.mouse = 'a' -- Enable mouse support in all modes
vim.opt.timeoutlen = 500 -- Délai pour les mappings normaux
vim.opt.ttimeoutlen = 10 -- Délai pour les codes de touches

vim.opt.relativenumber = true

---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'catppuccin'}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Improved nvim-tree mouse handling
local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")
  
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  
  -- Apply default mappings first
  api.config.mappings.default_on_attach(bufnr)
  
  -- Function to handle double-click behavior
  local function handle_double_click()
    local node = api.tree.get_node_under_cursor()
    if not node then return end
    
    if node.nodes then
      -- It's a directory, toggle it
      api.node.open.edit()
    else
      -- It's a file, open it
      api.node.open.edit()
      -- Ne ferme plus le tree automatiquement
    end
  end
  
  -- Map both double-click and Enter to the same behavior
  vim.keymap.set('n', '<2-LeftMouse>', handle_double_click, opts('Open/Toggle Double-Click'))
  vim.keymap.set('n', '<CR>', handle_double_click, opts('Open/Toggle Enter'))
end

-- Set the on_attach function for nvim-tree
M.on_attach_nvim_tree = nvim_tree_on_attach

return M
