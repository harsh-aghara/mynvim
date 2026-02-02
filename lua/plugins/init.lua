return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- These are some examples, uncomment them if you want to see them work!
    -- {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         require("configs.lspconfig")
    --     end,
    -- },

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
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
            },
        },
        opts = {
            lang = "cpp",                           -- your default coding language
            storage = {
                home = vim.fn.expand("~/leetcode"), -- stores solved problems locally
            },
        },
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
    --for lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Set foldmethod to use ufo
            vim.o.foldmethod = "expr"
            vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

            -- Configure ufo
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })

            -- Keymaps for folding
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        end,
    },
}