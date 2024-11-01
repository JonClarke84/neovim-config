require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Place this in your init.lua or a file that's sourced by init.lua

-- Set keymap to accept completion with Tab
vim.api.nvim_set_keymap(
  'i', -- Insert mode
  '<Tab>', -- Key to map
  'pumvisible() ? "\\<C-n>" : "\\<Tab>"', -- Expression to evaluate
  {expr = true, noremap = true} -- Options: 'expr' evaluates the expression, 'noremap' prevents recursive mapping
)

vim.cmd[[
func LogWordUnderCursor()
  exe "normal! yiw"
  exe "normal! console.log('')"
  exe "normal! hhp"
  exe "normal! li: "
  exe "normal! $i, "
  exe "normal! p"
endfunc
]]

vim.cmd[[noremap <leader>clw :call LogWordUnderCursor()<CR>]]

vim.api.nvim_set_keymap(
  'i', -- Insert mode
  '<Tab>', -- Key to map
  'pumvisible() ? "\\<YourAcceptSuggestionCommand>" : "\\<Tab>"', -- Replace <YourAcceptSuggestionCommand> with the plugin command
  {expr = true, noremap = true}
)

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
