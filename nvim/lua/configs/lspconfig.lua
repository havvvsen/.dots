require("nvchad.configs.lspconfig").defaults()

local servers = {
	"clangd",
	"html",
	"cssls",
	"luals",
	"rust_analyzer",
	"gopls",
	"basedpyright",
	"ts_ls",
	"tailwindcss",
	"bashls",
	"sqls",
	"zls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
