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

### Outils de base
- Neovim >= 0.11 (indispensable car la config utilise `vim.lsp.config`)
- Git (NVChad et Lazy ont besoin de git pour récupérer les plugins)
- [Nerd Font](https://www.nerdfonts.com/) installée + sélectionnée dans votre terminal pour que les icônes s'affichent partout
- `ripgrep` + `fd` (Telescope se base sur ces binaires pour des recherches rapides)
- [`lazygit`](https://github.com/jesseduffield/lazygit) si vous voulez utiliser la commande `<leader>gg` / `:LazyGit`

### Stack Go
- Installez [Go](https://go.dev/dl/) >= 1.21 et configurez `GOPATH` pour compiler/installer des binaires.
- C’est la seule dépendance “système” côté Go : à partir de là `:MasonInstallAll` s’occupera d’installer `gopls`, `gofumpt`, `golines`, `delve`, outils gopher, etc. lors du premier lancement.

### Stack Python
- Installez Python 3.10+ avec `pip`/`pipx` disponibles (pour pouvoir installer `debugpy` si besoin).
- Une fois Python présent, `:MasonInstallAll` installera automatiquement Pyright, Ruff LSP, black, isort, ruff, debugpy et tous les outils utilisés par la config.

### Astuce
- Dès que Go & Python sont installés, cloner ce repo puis lancez `nvim` et exécutez `:MasonInstallAll` (ou `:MasonInstall <liste>`) pour provisionner tous les binaires nécessaires avant de travailler sur vos projets.

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
