return {
    {
        "williamboman/mason.nvim",
        git = {
            timeout = 1200, -- Timeout in seconds for git clones
        },
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
        lazy = true,
        cmd = "Mason",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        git = {
            timeout = 1200, -- Timeout in seconds for git clones
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "jose-elias-alvarez/null-ls.nvim", -- formatting & linting
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local null_ls = require("null-ls")
            local lspconfig = require("lspconfig")

            -- Fullstack / Backend / Frontend LSPs
            local lsp_servers = {
                "pyright", "ruff_lsp",                                                -- Python
                "tsserver", "denols", "eslint", "tailwindcss", "cssls", "html", "jsonls", -- Web
                "vue_ls", "angularls", "svelte", "astro",                             -- Frontend frameworks
                "dockerls", "sqlls",                                                  -- Backend / DevOps
                "lua_ls",                                                             -- Lua / Neovim
            }

            mason_lspconfig.setup({ ensure_installed = lsp_servers })

            -- Common on_attach
            local on_attach = function(client, bufnr)
                local wk = require("which-key")
                wk.add({
                    { "<leader>c",  group = "LSP" },
                    { "<leader>cr", vim.lsp.buf.rename,                                  desc = "Rename Symbol" },
                    { "<leader>ca", vim.lsp.buf.code_action,                             desc = "Code Action" },
                    { "<leader>cd", vim.diagnostic.open_float,                           desc = "Diagnostics" },
                    { "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format File" },
                })
            end

            -- Auto-setup all LSPs
            mason_lspconfig.setup_handlers({
                function(server_name)
                    local config = {
                        on_attach = on_attach,
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        flags = { debounce_text_changes = 150 },
                    }

                    if server_name == "lua_ls" then
                        config.settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    maxPreload = 2000,
                                    preloadFileSize = 2000,
                                },
                                telemetry = { enable = false },
                            },
                        }
                    end

                    lspconfig[server_name].setup(config)
                end,
            })

            -- Null-ls: formatters & linters
            null_ls.setup({
                sources = {
                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.diagnostics.ruff,

                    -- JS / TS / React / Next.js
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.eslint,

                    -- CSS / HTML / JSON / Markdown
                    null_ls.builtins.formatting.prettier,

                    -- Lua
                    null_ls.builtins.formatting.stylua,
                },
                on_attach = on_attach,
            })
        end,
        lazy = true,
    }

}
