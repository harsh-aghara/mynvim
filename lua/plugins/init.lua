return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    {
        "ThePrimeagen/vim-be-good",
        lazy = false,
        event = { "BufReadPre", "BufNewFile" },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({})
        end,
    },

    -- LeetCode integration for Neovim
    {
        "kawre/leetcode.nvim",
        lazy = false,             -- ensures plugin loads on startup
        build = ":TSUpdate html", -- updates HTML parser for problem descriptions
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            lang = "cpp",                           -- your default coding language
            storage = {
                home = vim.fn.expand("~/leetcode"), -- stores solved problems locally
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },
}
