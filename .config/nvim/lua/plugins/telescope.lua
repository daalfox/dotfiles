return {
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
}
