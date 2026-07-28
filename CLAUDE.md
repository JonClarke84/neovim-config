# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

This is a NvChad-based Neovim configuration with custom modifications. The configuration follows a modular structure:

### Core Architecture
- **Entry Point**: `init.lua` - Main configuration file that loads core modules and sets up custom keymaps
- **Core Module**: `lua/core/` - Contains bootstrap logic, default configuration, mappings, and utility functions
- **Plugins**: `lua/plugins/` - All plugin definitions and configurations (tracked in git)
- **Custom**: `lua/custom/` - GITIGNORED; holds only `chadrc.lua` (theme). Do NOT put functional
  config here — this layer was lost in March 2026 precisely because it was untracked, taking the
  TypeScript LSP and lint setup with it. All functional config belongs in tracked files.

### Key Configuration Files
- `lua/custom/chadrc.lua` - Theme only (kanagawa)
- `lua/plugins/init.lua` - Full plugin list (Avante, Oil, yazi, nvim-lint, conform, etc.)
- `lua/plugins/configs/lspconfig.lua` - All LSP servers: lua_ls, ts_ls, gopls, kotlin_language_server, plus astro/ruby_lsp gated on their binaries existing

### Plugin Management
- Uses **lazy.nvim** as the plugin manager
- Plugin lockfile: `lazy-lock.json` maintains exact plugin versions
- Plugins are installed to `~/.local/share/nvim/lazy/`

### Key Features Enabled
- **AI Integration**: Copilot and Avante.nvim for AI-assisted coding
- **LSP**: Full language server support with Mason for package management
- **Navigation**: Telescope for fuzzy finding
- **File Management**: nvim-tree, Oil.nvim, and yazi.nvim for file exploration
- **Development Tools**: nvim-lint (eslint_d) for linting, conform.nvim (prettier) for formatting

### Custom Keybindings
- `<leader>clw` - Log word under cursor (JavaScript console.log helper)
- `<leader>useeffect` - Insert React useEffect boilerplate
- `<C-l>` - Accept Copilot suggestions
- `<leader>fm` - Format buffer (conform.nvim: prettier, LSP fallback)

### Configuration Management
- NvChad auto-reloads configuration when custom files are saved
- Base46 theme system with compiled bytecode themes stored in `~/.local/share/nvim/nvchad/base46/`

### Development Workflow
- Configuration is managed through git; keep all functional config in tracked files
- Plugin management through lazy.nvim with lockfile (`lazy-lock.json`, tracked) for reproducible installs

### LSP and Language Support
Mason's ensure_installed lists these servers and tools (install with `:MasonInstallAll`):
- prettier (formatting, consumed by conform.nvim)
- eslint_d (linting, consumed by nvim-lint; only runs when an eslint config exists above the file)
- typescript-language-server (TypeScript support, enabled as `ts_ls`)
- gopls (Go language server)
- kotlin-language-server, ruby-lsp, deno, lua-language-server

The configuration is optimized for web development (JavaScript/TypeScript/React) and Go development with comprehensive AI assistance integration.

### Plugin Management Guidelines
- When adding or removing a plugin, make sure to update the README