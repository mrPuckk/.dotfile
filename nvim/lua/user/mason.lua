local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
}

function M.config()
    -- import mason
    local mason = require "mason"
    -- import mason-lspconfig
    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    }

    local servers = {
        "lua_ls",
        "clangd",
    }
    mason_lspconfig.setup {
        ensure_installed = servers,
    }
end

return M
