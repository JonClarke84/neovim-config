# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

This is a NvChad-based Neovim configuration with custom modifications. The configuration follows a modular structure:

### Core Architecture
- **Entry Point**: `init.lua` - Main configuration file that loads core modules and sets up custom keymaps
- **Core Module**: `lua/core/` - Contains bootstrap logic, default configuration, mappings, and utility functions
- **Plugins**: `lua/plugins/` - Default NvChad plugin configurations
- **Custom**: `lua/custom/` - User-specific customizations and plugin overrides

### Key Configuration Files
- `lua/custom/chadrc.lua` - Main configuration file setting theme (kanagawa) and plugin imports
- `lua/custom/plugins.lua` - Custom plugin definitions and configurations
- `lua/plugins/init.lua` - Default plugin setup with additional plugins (Avante, ChatGPT, Oil, etc.)

### Plugin Management
- Uses **lazy.nvim** as the plugin manager
- Plugin lockfile: `lazy-lock.json` maintains exact plugin versions
- Plugins are installed to `~/.local/share/nvim/lazy/`

### Key Features Enabled
- **AI Integration**: Copilot, ChatGPT.nvim, and Avante.nvim for AI-assisted coding
- **LSP**: Full language server support with Mason for package management
- **Navigation**: Leap.nvim for fast movement, Telescope for fuzzy finding
- **File Management**: nvim-tree and Oil.nvim for file exploration
- **Terminal**: ToggleTerm for integrated terminal access
- **Development Tools**: Formatter, linter, and null-ls for code quality

### Custom Keybindings
- `<leader>clw` - Log word under cursor (JavaScript console.log helper)
- `<leader>useeffect` - Insert React useEffect boilerplate
- `<C-l>` - Accept Copilot suggestions
- `s`/`S` - Leap forward/backward navigation

### Configuration Management
- NvChad auto-reloads configuration when custom files are saved
- Base46 theme system with compiled bytecode themes stored in `~/.local/share/nvim/nvchad/base46/`

### Development Workflow
- Configuration is managed through git
- Custom configurations live in `lua/custom/` to separate from upstream NvChad changes
- Plugin management through lazy.nvim with lockfile for reproducible installs

### LSP and Language Support
Mason ensures these language servers and tools are installed:
- prettier (formatting)
- eslint-lsp (JavaScript/TypeScript linting)  
- typescript-language-server (TypeScript support)
- gopls (Go language server)

The configuration is optimized for web development (JavaScript/TypeScript/React) and Go development with comprehensive AI assistance integration.

### Plugin Management Guidelines
- When adding or removing a plugin, make sure to update the README