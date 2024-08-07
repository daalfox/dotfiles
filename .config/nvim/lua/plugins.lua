return {
    "savq/melange-nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end,
    },
    "williamboman/mason.nvim",
    {
        "stevearc/conform.nvim",
        lazy = false,
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                vue = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                jsonc = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
            },
        },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ lsp_fallback = true })
                end,
                mode = { "n", "v" },
                desc = "Format",
            },
        },
    },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    {
        "rafamadriz/friendly-snippets",
        init = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    "saadparwaiz1/cmp_luasnip",

    -- git stuff
    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                map("n", "]g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gs.nav_hunk("next")
                    end
                end, "Next Hunk")
                map("n", "[g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gs.nav_hunk("prev")
                    end
                end, "Prev Hunk")
                map({ "n", "v" }, "<leader>gs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Stage Hunk")
                map({ "n", "v" }, "<leader>gr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Reset Hunk")
            end,
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        opts = {
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            end,
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
        },
        keys = {
            {
                "<leader>t",
                function()
                    require("nvim-tree.api").tree.toggle()
                end,
                mode = { "n", "v" },
                desc = "Toggle neovim tree",
            },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<F1>",
                function()
                    require("telescope.builtin").find_files()
                end,
                mode = { "n", "v" },
                desc = "Fuzzy find files",
            },
            {
                "<leader>/",
                function()
                    require("telescope.builtin").live_grep()
                end,
                mode = { "n", "v" },
                desc = "Live grep",
            },
            {
                "<F2>",
                function()
                    require("telescope.builtin").buffers()
                end,
                mode = { "n", "v" },
                desc = "Telescope buffers",
            },
        },
    },
}
