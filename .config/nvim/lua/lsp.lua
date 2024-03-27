local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
local utils = require("utils")

local servers = { "lua_ls", "tsserver", "volar" }
for _, lsp in ipairs(servers) do
    if utils.isModuleAvailable(string.format("custom_lsp_setup.%s", lsp)) then
        lspconfig[lsp].setup(require(string.format("custom_lsp_setup.%s", lsp)))
    else
        lspconfig[lsp].setup({
            capabilities = capabilities,
        })
    end
end

local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})
