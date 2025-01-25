return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer",
            "williamboman/mason-lspconfig"
        },
        config = function()
            local mason = require("mason")
            local mason_lsp_config = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup()
            mason_lsp_config.setup({
                ensure_installed = {
                    "lua_ls",
                    "ruff_lsp",
                }
            })
            mason_tool_installer.setup({
                ensure_installed = {
                    "black",
                    "isort",
                    "prettier",
                    "stylua",
                    "flake8",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim",                   opts = {} },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            lspconfig.lua_ls.setup({})
            lspconfig.ruff_lsp.setup({})

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    opts.desc = "Show LSP references"
                    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                    opts.desc = "Go to declaration"
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Go to definitions"
                    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                    opts.desc = "Go to implementation"
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                    opts.desc = "Go to type definitions"
                    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                    opts.desc = "See code actions"
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Smart rename"
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    opts.desc = "Show buffer diagnostics"
                    vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                    opts.desc = "Go to prev diagnostic"
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                    opts.desc = "Go to next diagnostic"
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                    opts.desc = "Show line diagnostics"
                    vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

                    opts.desc = "Show documentation for what is under the cursor"
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                    opts.desc = "Restart LSP"
                    vim.keymap.set("n", "<leader>rs", ":LspResart<CR>", opts)
                end,
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end,
    },
}
