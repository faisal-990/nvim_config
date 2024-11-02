-- Set the runtime path for lazy.nvim
vim.opt.runtimepath:prepend(vim.fn.expand("~/.local/share/nvim/lazy/lazy.nvim"))

-- Load all modules
require("settings")
require("plugins")
require("keymaps")
require("themes")
require("lsp")
require("pairing")

