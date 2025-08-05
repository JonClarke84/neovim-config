# Jonathan's Neovim Configuration

A highly optimized Neovim configuration built on NvChad, customized for web development with a focus on performance and productivity.

## Features

- **⚡ Fast Buffer Switching**: Optimized LSP and plugin loading for instant buffer changes
- **🎨 Beautiful UI**: Kanagawa theme with custom NvChad components
- **🤖 AI Integration**: Copilot for code completion and Avante.nvim for AI assistance
- **📝 Language Support**: Full LSP support for TypeScript, JavaScript, Go, Ruby, Kotlin
- **🔧 Smart Formatting**: Prettier integration with manual control via `:Prettier` command
- **🛠️ Development Tools**: Integrated terminal, file explorer, fuzzy finder, and Git integration

## Key Customizations

### Performance Changes
- **Deferred Plugin Loading**: TreeSitter, colorizer, and LSP configuration load asynchronously
- **Optimized Diagnostics**: Smart diagnostic display with performance limits for large files
- **Eliminated Buffer Delays**: Removed heavy ESLint LSP validation that caused switching delays

### AI and Productivity
- **GitHub Copilot**: Configured with `<C-l>` for suggestion acceptance
- **Avante.nvim**: Command-only loading for AI-powered code assistance
- **Custom Keybindings**: 
  - `<leader>clw` - Console.log word under cursor
  - `<leader>useeffect` - React useEffect boilerplate

### Language Support
- **TypeScript/JavaScript**: Full LSP with optimized diagnostics
- **Go**: Complete toolchain with formatting, imports, and linting
- **Ruby**: Ruby LSP integration
- **Kotlin**: Language server support

## Plugin Configuration

### Core Plugins
- **LSP**: `nvim-lspconfig` with Mason for package management
- **Completion**: `nvim-cmp` with multiple sources
- **Syntax**: `nvim-treesitter` with deferred loading
- **File Management**: `nvim-tree` and `oil.nvim`
- **Fuzzy Finding**: `telescope.nvim`
- **Git**: `gitsigns.nvim`

### Custom Additions
- **Copilot**: GitHub AI pair programming
- **Avante**: AI code assistance
- **none-ls**: Formatting with Prettier (Go auto-format, JS/TS manual)
- **Oil**: Alternative file manager
- **Markdown Preview**: Live preview for documentation

## Installation

1. **Backup existing config**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/JonClarke84/neovim-config.git ~/.config/nvim
   ```

3. **Install dependencies**:
   ```bash
   nvim
   # Let lazy.nvim install plugins automatically
   # Run :MasonInstallAll to install language servers
   ```

## Language Servers

The following language servers are automatically installed via Mason:

- `lua-language-server` - Lua
- `typescript-language-server` - TypeScript/JavaScript
- `prettier` - Code formatting
- `eslint_d` - Fast ESLint diagnostics (when ESLint config present)
- `gopls` - Go
- `ruby-lsp` - Ruby
- `kotlin-language-server` - Kotlin
- `deno` - Deno TypeScript

## Custom Commands

- `:Prettier` - Format current buffer with Prettier (JS/TS/JSON/CSS/HTML)
- `:MasonInstallAll` - Install all configured language servers
- Various NvChad commands (`:NvChadUpdate`, `:Telescope`, etc.)

## Key Bindings

### Custom Bindings
- `<leader>clw` - Log word under cursor (JavaScript console.log)
- `<leader>useeffect` - Insert React useEffect boilerplate
- `<C-l>` - Accept Copilot suggestion

### NvChad Default Bindings
- `<leader>ff` - Find files
- `<leader>fw` - Find word
- `<leader>e` - Toggle file explorer
- `<leader>th` - Toggle theme
- `<C-n>` - Toggle nvim-tree

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point with custom functions
├── lua/
│   ├── core/               # NvChad core configuration
│   ├── plugins/            # Plugin configurations
│   │   ├── init.lua        # Main plugin list with optimizations
│   │   └── configs/        # Individual plugin configs
│   │       ├── lspconfig.lua    # LSP with performance optimizations
│   │       └── mason.lua        # Language server management
│   └── custom/             # User customizations
│       ├── chadrc.lua      # Main config (theme: kanagawa)
│       ├── plugins.lua     # Custom plugin additions
│       └── configs/        # Custom plugin configurations
│           ├── null-ls.lua      # Formatting configuration
│           ├── lint.lua         # Linting (disabled)
│           └── lspconfig.lua    # Additional LSP configs
├── CLAUDE.md              # AI assistant guidance
└── lazy-lock.json         # Plugin version lockfile
```

## Performance

- **Startup Time**: ~20-50ms (very fast)
- **Buffer Switching**: ~0.06ms for small files, ~29ms for large TypeScript files
- **Memory Usage**: Optimized with lazy loading and deferred initialization

## Customization

The configuration is built to be easily customizable:

1. **Theme**: Change in `lua/custom/chadrc.lua`
2. **Plugins**: Add/remove in `lua/custom/plugins.lua`
3. **LSP**: Modify `lua/custom/configs/lspconfig.lua`
4. **Keybindings**: Update in `init.lua` or respective config files

## Troubleshooting

### Common Issues

1. **LSP not working**: Run `:Mason` and install required language servers
2. **Slow startup**: Check `:profile` output and disable unnecessary plugins
3. **Plugin errors**: Run `:Lazy` and update/reinstall problematic plugins

### Debug Commands

- `:checkhealth` - Check Neovim health
- `:LspInfo` - Check LSP status
- `:Mason` - Manage language servers
- `:Lazy` - Manage plugins

## Credits

- **NvChad**: Base configuration framework
- **siduck**: Original NvChad creator
- **Various plugin authors**: For the amazing Neovim ecosystem

---

*This configuration is optimized for web development with TypeScript, React, and Go. It prioritizes performance and productivity while maintaining a beautiful and functional interface.*