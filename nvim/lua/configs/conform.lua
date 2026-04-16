local options = {
	formatters = {
		zigfmt = {
			command = "/usr/bin/zig",
			args = { "fmt", "$FILENAME" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		go = { "gofmt" },
		python = { "ruff" },
		css = { "prettierd" },
		html = { "prettierd" },
		c = { "clang-format " },
		-- zig = { "zigfmt" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
