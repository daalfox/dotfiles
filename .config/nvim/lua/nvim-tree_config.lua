local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

require("nvim-tree").setup({
    on_attach = on_attach,
    renderer = {
        root_folder_label = false,
        highlight_git = true,
        icons = {
            show = {
                file = false,
                folder = false,
                git = false,
            },
        },
    },
})
