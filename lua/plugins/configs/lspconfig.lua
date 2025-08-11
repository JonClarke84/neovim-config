dofile(vim.g.base46_cache .. "lsp")

-- Define LSP diagnostic signs using modern vim.fn.sign_define (no deprecation)
vim.fn.sign_define("DiagnosticSignError", { text = "󰅙", numhl = "DiagnosticSignError", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "󰋼", numhl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", numhl = "DiagnosticSignHint", texthl = "DiagnosticSignHint" })

-- Configure diagnostics with performance optimizations for large files
vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    spacing = 2,
    source = "if_many",
    -- Show INFO level diagnostics for ESLint unused variable warnings
    severity = { min = vim.diagnostic.severity.INFO },
  },
  signs = {
    severity = { min = vim.diagnostic.severity.HINT },
  },
  underline = {
    severity = { min = vim.diagnostic.severity.INFO },
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
}

-- Optimize LSP handlers for better performance
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
  max_width = 80,
  max_height = 20,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  focusable = false,
  relative = "cursor",
  max_width = 80,
})

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
  
  -- Optimize for large files by reducing diagnostic frequency
  local buf_line_count = vim.api.nvim_buf_line_count(bufnr)
  if buf_line_count > 1000 then
    -- For large files, reduce diagnostic update frequency
    client.server_capabilities.documentHighlightProvider = false
    -- Disable some resource-intensive features for large files
    if client.name == "typescript-language-server" or client.name == "eslint" then
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          vim.diagnostic.hide(nil, bufnr)
          vim.defer_fn(function()
            vim.diagnostic.show(nil, bufnr)
          end, 500)
        end,
      })
    end
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

require("lspconfig").lua_ls.setup {
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
}

require('lspconfig').astro.setup{
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities
}

return M
