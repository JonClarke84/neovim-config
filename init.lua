require "core"

-- Compatibility shim for vim.lsp.get_active_clients (deprecated in 0.11)
-- Maintains backward compatibility with NvChad UI components
if not vim.lsp.get_active_clients then
  vim.lsp.get_active_clients = function(opts)
    opts = opts or {}
    return vim.lsp.get_clients(opts)
  end
end

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Place this in your init.lua or a file that's sourced by init.lua


-- Log word under cursor function
local function log_word_under_cursor()
  -- Get the word under cursor
  local word = vim.fn.expand('<cword>')
  -- Get current line content and position
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  
  -- Create the console.log line
  local log_line = string.format("console.log('%s:', %s)", word, word)
  
  -- Insert the log line on the next line
  vim.api.nvim_buf_set_lines(0, row, row, false, {log_line})
  
  -- Move cursor to the end of the inserted line
  vim.api.nvim_win_set_cursor(0, {row + 1, #log_line})
end

vim.keymap.set('n', '<leader>clw', log_word_under_cursor, { desc = 'Console log word under cursor' })

-- set <leader> useeffect to do the boilerplate for useEffect in React
vim.cmd[[
  func UseEffectBoilerPlate()
    exe "normal! o"
    exe "normal! iuseEffect(() => {"
    exe "normal! o"
    exe "normal! i}, [])"
    exe "normal! ko"
    exe "normal! i \<Tab>"
    startinsert
  endfunc
]]

vim.cmd[[noremap <leader>useeffect :call UseEffectBoilerPlate()<CR>]]


-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.opt.relativenumber = true
