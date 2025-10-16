# Optimized Neovim Configuration

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

## Plugin List

### NvChad Core Plugins
- **[base46](https://github.com/NvChad/base46)** - Theme engine with 56+ themes
- **[ui](https://github.com/NvChad/ui)** - Custom statusline, tabufline, and UI components
- **[nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)** - Color highlighter (deferred loading)
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons

### Language Support & LSP
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configurations (deferred loading)
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - Language server package manager
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting (deferred loading)
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)** - Formatting and diagnostics

### Completion & Snippets
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - LuaSnip completion source
- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP completion source
- **[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** - Buffer completion source
- **[cmp-path](https://github.com/hrsh7th/cmp-path)** - Path completion source
- **[cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)** - Lua completion source
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine

### File Management & Navigation
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - Alternative file manager
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder and picker

### AI & Productivity
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration
- **[avante.nvim](https://github.com/yetone/avante.nvim)** - AI code assistance (command-only loading)
- **[img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim)** - Image pasting support (lazy loaded)
- **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Markdown rendering (lazy loaded)

### Development Tools
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration and signs
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-close brackets and quotes
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding helper
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Async linting with eslint_d, golangci-lint, markdownlint

### Markdown & Documentation
- **[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** - Live markdown preview

### Utilities
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions
- **[kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)** - Current theme

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

- `:MasonInstallAll` - Install all configured language servers
- `:Prettier` - Format current buffer with Prettier (JS/TS/JSON/CSS/HTML/Markdown) via none-ls
- `:Copilot` - Toggle GitHub Copilot
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
│           ├── null-ls.lua      # Formatting configuration (Prettier, gofmt, etc)
│           ├── lint.lua         # Linting configuration (ESLint, golangci-lint, markdownlint)
│           └── lspconfig.lua    # Additional LSP configs (TypeScript, Go, Ruby, Kotlin)
├── CLAUDE.md              # AI assistant guidance
└── lazy-lock.json         # Plugin version lockfile
```

## Performance

- **Startup Time**: ~20-50ms (very fast)
- **Buffer Switching**: ~0.06ms for small files, ~29ms for large TypeScript files
- **Memory Usage**: Optimized with lazy loading and deferred initialization
- **LSP API**: Modern vim.lsp.config API (Neovim 0.11+ compatible)

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