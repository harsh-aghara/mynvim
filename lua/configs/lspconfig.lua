-- local nvlsp = require("nvchad.configs.lspconfig")
-- local on_attach = nvlsp.on_attach
-- local on_init = nvlsp.on_init
-- local capabilities = nvlsp.capabilities
-- local lspconfig = require("lspconfig")
--
-- -- List of LSP servers you want
-- local servers = { "pyright", "clangd", "html", "cssls", "lua_ls" }
--
-- for _, server in ipairs(servers) do
--     local opts = {
--         on_attach = on_attach,
--         on_init = on_init,
--         capabilities = capabilities,
--     }
--
--     -- Lua-specific settings
--     if server == "lua_ls" then
--         opts.settings = {
--             Lua = {
--                 diagnostics = { globals = { "vim" } },
--                 workspace = {
--                     library = {
--                         vim.fn.expand("$VIMRUNTIME/lua"),
--                         vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
--                         vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
--                     },
--                 },
--             },
--         }
--     end
--
--     lspconfig[server].setup(opts)
-- end
-- Do NOT: local lspconfig = require("lspconfig")

-- 1) Global defaults for all servers
vim.lsp.config("*", {
    -- define own on_attach/on_init if needed; avoid pulling from modules that require('lspconfig')
    on_attach = function(client, bufnr) end,
    on_init = function(client, _init) end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Keep this near other vim.lsp.config blocks
vim.lsp.config("pyright", {
    settings = {
        -- Optional: trim Pyright features Ruff already covers
        pyright = {
            disableOrganizeImports = true, -- avoid dueling import organizers
            disableTaggedHints = true, -- avoid grayed/strike hints for unused symbols
        },                           -- both are first-class Pyright settings

        python = {
            analysis = {
                -- Remove duplicate "unused" noise; Ruff handles these (F401/F841)
                diagnosticSeverityOverrides = {
                    reportUnusedImport = "none",
                    reportUnusedVariable = "none",
                },
                -- keep any other analysis settings here (e.g., typeCheckingMode)
            },
        },
    },
})


-- 2) Server-specific overrides (Lua)
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
            },
        },
    },
})

-- 3) Mason + mason-lspconfig: auto-install and auto-enable
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "html", "cssls", "lua_ls" }, -- optional
    automatic_enable = true,                                               -- uses vim.lsp.enable() for installed servers
})

-- No calls to require('lspconfig') and no lspconfig[server].setup(...)
