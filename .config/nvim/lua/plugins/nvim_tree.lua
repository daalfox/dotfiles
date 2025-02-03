return {
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
					folder = true,
					folder_arrow = false,
					git = true,
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
}
