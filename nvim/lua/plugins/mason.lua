return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					-- formatters
					"stylua",
					"shfmt",
					"clang-format",
					"prettierd",
				},
			},
		},
		"saghen/blink.cmp",
	},

	opts = {
		servers = {
			bashls = {},
			tailwindcss = {},
		},
		ensure_installed = {
			-- lsps only
			"lua_ls",
			"bashls",
			"ts_ls",
			"emmet_language_server",
			"html",
			"tailwindcss",
			"cssls",
			"asm_lsp",
			"jsonls",
			"taplo", -- toml lsp
			"gopls",
			-- "rust_analyzer"
		},
		automatic_enable = {
			"lua_ls",
			"bashls",
			"emmet_language_server",
			"html",
			"cssls",
			"tailwindcss",
			"jsonls",
			"taplo",
			"gopls",
			exclude = {},
		},
	},
}
