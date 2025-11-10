# NVChad + Dreamsofcode Go & Python Configuration

A modern Neovim setup based on [NVChad](https://nvchad.com/), with advanced Go and Python support (inspiré de dreamsofcode), un dashboard stylé, et le thème Catppuccin.

## 🚀 Features

- ⚡️ Fast startup with lazy loading (NVChad core)
- 🎨 Catppuccin theme (mocha, latte, etc.)
- 🏠 Beautiful dashboard (alpha-nvim)
- 🌳 File explorer (NvimTree)
- 🔍 Fuzzy finding (Telescope)
- 💡 LSP support (Go, Python, autocompletion, diagnostics)
- 🐍 Python: dap, dap-ui, dap-python, linting, formatting, testing
- 🦫 Go: dap-go, gopher.nvim, linting, formatting, testing
- 🧩 Easy plugin management (custom/plugins.lua)
- ⌨️ Intuitive keybindings (which-key integration)
- 📝 Git integration (LazyGit)
- 🖼️ Full Nerd Font support (pour les icônes)

## Prerequisites

- Neovim >= 0.11 (nécessaire pour `vim.lsp.config`)
- Git
- [Nerd Font](https://www.nerdfonts.com/) installée et sélectionnée dans votre terminal
- (Optionnel) ripgrep, fd

## Installation

1. Sauvegardez votre ancienne config :
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```
2. Clonez ce repo :
```bash
git clone https://gitlab.com/omega8280051/nvim.git ~/.config/nvim
```
3. Lancez Neovim :
```bash
nvim
```
- Laissez NVChad/Lazy installer tous les plugins et outils automatiquement.

## Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── custom/
│   │   ├── plugins.lua      # Tous les plugins custom (Go, Python, UI...)
│   │   ├── mappings.lua     # Raccourcis personnalisés (diagnostics, dap, etc.)
│   │   └── configs/         # Configs LSP, null-ls, etc.
│   └── ...
```

## Key Features

### Plugin Management
- Utilise Lazy/NVChad pour une gestion efficace et rapide des plugins
- Plugins custom dans `lua/custom/plugins.lua`

### Développement Go & Python
- Go: gopls, dap-go, gopher.nvim, linting, formatting, tests
- Python: pyright, ruff-lsp, dap-python, dap-ui, linting, formatting, tests
- null-ls (none-ls) pour l'intégration des outils externes
- LSP configuré via `vim.lsp.config` (Neovim 0.11+), donc plus de warnings `require('lspconfig')`

### UI & Navigation
- Catppuccin theme (modifiable dans plugins.lua)
- Dashboard alpha-nvim (splash screen)
- NvimTree pour l'exploration de fichiers
- Which-key pour découvrir tous les raccourcis

### Diagnostics & Keybindings
- Menu diagnostics complet sur `<leader>d` (voir which-key)
- Raccourcis DAP, Go, Python, etc. dans `mappings.lua`

## Mise à jour majeure : v2.0.0
- Migration complète vers NVChad
- Stack Go & Python dreamsofcode
- Thème Catppuccin par défaut
- Dashboard alpha-nvim
- Plugins et mappings custom réorganisés

## Personnalisation
- Ajoutez vos plugins dans `lua/custom/plugins.lua`
- Ajoutez vos mappings dans `lua/custom/mappings.lua`
- Modifiez les configs LSP/null-ls dans `lua/custom/configs/`

## Problèmes connus
- Les icônes "?" dans NvimTree = police Nerd Font non sélectionnée dans le terminal
- Le splash screen n'apparaît que si vous lancez `nvim` sans fichier

## Contribuer
N'hésitez pas à ouvrir une issue ou une MR pour toute suggestion ou amélioration !

---

**Version : v2.0.0 (changement majeur, NVChad + Go/Python/Theme)** 
