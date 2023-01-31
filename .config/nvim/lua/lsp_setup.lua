local ok_mason, mason = pcall(require, "mason")
local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
local ok_lsp, lsp = pcall(require, "lspconfig")
-- Completion specifics
local ok_cmp, cmp = pcall(require, "cmp")
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local ok_snip, luasnip = pcall(require, "luasnip")
-- Language specifics
local ok_rusttools, rust_tools = pcall(require, "rust-tools")

local ready = ok_mason and ok_mason_lsp and ok_lsp and ok_cmp_lsp and ok_rusttools and ok_snip and ok_cmp

if not ready then
    do
        return
    end
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local servers = {
    "rust_analyzer",
    "svelte",
    "tsserver",
    "yamlls",
    "pyright",
    "jsonls",
    "html",
    "cssls",
    "sumneko_lua",
    "dockerls",
    "tailwindcss",
    "taplo",
    "astro",
}

local server_settings = {
    ["sumneko_lua"] = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

local server_with_disabled_formatting = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["tailwindcss"] = true,
    ["cssls"] = true,
}

local use_formatter = {
    ["tsserver"] = true,
    ["sumneko_lua"] = true,
    ["cssls"] = true,
}

mason.setup()
mason_lsp.setup({
    ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

-- The biding for every servers
local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>", bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)

    if server_with_disabled_formatting[client.name] then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        if use_formatter[client.name] then
            vim.keymap.set("n", "<leader>F", "<CMD>Format<CR>", bufopts)
        end
    else
        vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
    end
end

for _, server in pairs(servers) do
    if server == "rust_analyzer" then
        rust_tools.setup({ tools = { on_initialized = on_attach } })
    else
        lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server_settings[server],
        })
    end
end

-- Completion stuffs
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
    }),
})
