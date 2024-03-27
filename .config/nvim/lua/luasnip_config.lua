local luasnip = require("luasnip")

luasnip.setup({
    update_events = "TextChanged, TextChangedI",
})

vim.keymap.set({ "i", "s" }, "<C-f>", function()
    luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-b>", function()
    luasnip.jump(-1)
end, { silent = true })
