return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("rose-pine")
		vim.opt.background = "light"
	end,
}
