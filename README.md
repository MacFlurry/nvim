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
- [Go](https://go.dev/dl/) >= 1.21 avec `GOPATH` configuré pour pouvoir compiler, lancer les tests et installer les outils.
- Serveur de langage : installez `gopls` via `:MasonInstall gopls` (ou `go install golang.org/x/tools/gopls@latest` si vous préférez gérer les binaires vous-même).
- Formatters/Linters utilisés par `null-ls` : `gofumpt`, `goimports-reviser`, `golines` (`go install mvdan.cc/gofumpt@latest`, etc.). Ils doivent être accessibles dans votre `$PATH`.
- Debug Go : `dlv` (Delve) pour `dap-go` (`go install github.com/go-delve/delve/cmd/dlv@latest`).
- Outils gopher.nvim (pour les mappings `GoTagAdd` / génération de code) : `gomodifytags`, `gotests`, `impl`, `iferr` (`go install github.com/fatih/gomodifytags@latest`, ...).

### Stack Python
- Python 3.10+ et `pip`/`pipx`.
- Serveurs de langage : utilisez `:MasonInstall pyright ruff-lsp` pour installer Pyright et Ruff LSP (ou `npm install -g pyright` si vous préférez les gérer hors Mason).
- Outils `null-ls` : `black`, `isort`, `ruff` (`pip install black isort ruff` ou versions `pipx`).
- Debug Python : `debugpy` pour `dap-python` (`pip install debugpy`).

### Astuce
- Après installation, lancez `:Mason` puis `:MasonInstallAll`/` :MasonInstall <serveur>` pour vous assurer que tous les binaires (gopls, pyright, ruff, etc.) sont présents avant d'ouvrir un projet Go/Python.

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
