--keymapping for goto references and definition
-- LSP mappings using Telescope
vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<cr>", { desc = "Telescope Go to Definition" })
vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<cr>", { desc = "Telescope Go to References" })
vim.keymap.set('n', '<leader>gi', "<cmd>Telescope lsp_implementations<cr>", { desc = "Telescope Go to Implementation" })
vim.keymap.set('n', '<leader>ds', "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
vim.keymap.set('n', '<leader>ws', "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })

-- Key mappings for plugins and common actions
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

