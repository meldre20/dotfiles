dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

local default_capabilities = vim.lsp.protocol.make_client_capabilities()
default_capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

-- vim.lsp.default_config.capabilities = vim.tbl_deep_extend(
--     "force",
--     vim.lsp.default_config.capabilities or {},
--     default_capabilities
-- )
vim.lsp.config("*", {
    capabilities = default_capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- Disable formatting if you use a separate formatter (e.g., conform.nvim)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- Load NvChad's default LSP keymaps
        utils.load_mappings("lspconfig", { buffer = bufnr })

        -- Signature help
        if client.server_capabilities.signatureHelpProvider then
            require("nvchad.signature").setup(client)
        end

        -- Semantic tokens toggle
        if not utils.load_config().ui.lsp_semantic_tokens and client:supports_method "textDocument/semanticTokens" then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

-- LUA_LS
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
vim.lsp.enable("lua_ls")

-- PYRIGHT
vim.lsp.config("pyright", {
    filetypes = { "python" },
})
vim.lsp.enable("pyright")

-- RUST_ANALYZER
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust_analyzer"] = {
            imports = {
                granularity = { group = "module" },
                prefix = "self",
            },
            cargo = {
                buildScripts = { enable = true },
            },
            procMacro = { enable = true },
        },
    },
})
vim.lsp.enable("rust_analyzer")

-- CLANGD
vim.lsp.config("clangd", {
    filetypes = { "c", "cpp", "cxx", "cc" },
    -- Note: The custom 'inlay_hints' table key was a non-standard lspconfig extension.
    -- In Neovim 0.10+, native inlay hints are managed globally via: vim.lsp.inlay_hint.enable()
})
vim.lsp.enable("clangd")

-- Export empty elements to maintain backward compatibility with other NvChad modules
M.on_attach = function() end
-- M.capabilities = vim.lsp.default_config.capabilities
M.capabilities = default_capabilities

return M
