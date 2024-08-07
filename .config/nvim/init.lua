local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("before_lazy")
require("lazy").setup("plugins")
require("core")
require("eye_candy")
require("mason").setup()
require("lsp")
require("luasnip_config")
require("gitsigns").setup()
require("diagnostic_config")
