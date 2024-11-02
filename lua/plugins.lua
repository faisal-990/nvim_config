-- plugins.lua

-- Set up plugins using lazy.nvim
require('lazy').setup({
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            require('gruvbox').setup({
                contrast = "medium",
            })
            vim.cmd('colorscheme gruvbox')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    -- LSP configuration
    { 'neovim/nvim-lspconfig' },
    -- treesitter config
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "python", "javascript", "html", "css", "cpp" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    -- brackets auto complete
        {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    prompt_prefix = "> ",
                    sorting_strategy = "ascending",
                    layout_strategy = "flex",
                }
            }
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("ibl").setup {
                indent = {
                    char = "│",
                },
                scope = {
                    show_start = false,
                    show_end = false,
                },
            }
        end
    },
})

