local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = { "html", "cssls", "ts_ls", "clangd" }

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        capabilities = capabilities,
    })

    vim.lsp.enable(lsp)
end
