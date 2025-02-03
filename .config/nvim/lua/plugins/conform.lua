return {
	"stevearc/conform.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup()
		end,
	},
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			vue = { "prettier" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
			jsonc = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
			sql = { "sql_formatter" },
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
}
