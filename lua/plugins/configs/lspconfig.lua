dofile(vim.g.base46_cache .. "lsp")

-- Configure diagnostics with performance optimizations for large files
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
    severity = { min = vim.diagnostic.severity.HINT },
  },
  virtual_text = {
    prefix = "",
    spacing = 2,
    source = "if_many",
    -- Limit virtual text to reduce rendering overhead
    severity = { min = vim.diagnostic.severity.WARN },
  },
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "single",
    source = "if_many",
    header = "",
    prefix = "",
    max_width = 80,
    max_height = 20,
  },
})

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
  
  -- Optimize for large files by reducing highlight churn
  if vim.api.nvim_buf_line_count(bufnr) > 1000 then
    client.server_capabilities.documentHighlightProvider = false
  end
end

-- disable semantic tokens
M.on_init = function(client, _)
  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Lua Language Server
vim.lsp.config('lua_ls', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

vim.lsp.enable('lua_ls')

-- TypeScript Language Server
vim.lsp.config('ts_ls', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

vim.lsp.enable('ts_ls')

-- Go Language Server
vim.lsp.config('gopls', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

vim.lsp.enable('gopls')

-- Kotlin Language Server
vim.lsp.config('kotlin_language_server', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

vim.lsp.enable('kotlin_language_server')

-- Astro Language Server (astro-ls is not a Mason ensure_installed entry;
-- only enable when the binary is actually present)
vim.lsp.config('astro', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

if vim.fn.executable('astro-ls') == 1 then
  vim.lsp.enable('astro')
end

-- Ruby LSP (Mason lists ruby-lsp but its install depends on the local Ruby
-- toolchain; only enable when the binary is actually present)
vim.lsp.config('ruby_lsp', {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
})

if vim.fn.executable('ruby-lsp') == 1 then
  vim.lsp.enable('ruby_lsp')
end

return M
