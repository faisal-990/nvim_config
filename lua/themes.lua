-- theme.lua

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

vim.cmd('syntax enable')  -- Enable syntax highlighting
vim.o.background = 'dark' -- Use dark background

