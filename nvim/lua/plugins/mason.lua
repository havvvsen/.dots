-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "clangd",
        "rust-analyzer",
        "ty",
        "gopls",
        "protols",

        -- Web Dev --
        "vtsls",
        "svelte-language-server",
        "tailwindcss-language-server",
        "emmet-language-server",
        "css-lsp",

        -- Devops --
        "dockerfile-language-server",
        "yaml-language-server",
        "bash-language-server",
        "json-lsp",
        "taplo",
        -- "cmake-language-server",
        -- "nginx-language-server",
        -- "nginx-config-formatter",
        -- "postgres-language-server",
        -- "sqls",

        -- install formatters
        "stylua",
        "prettier",
        "clang-format",
        "shfmt",
        -- "buf",
        "ruff",
        "yamlfmt",

        -- install debuggers
        "debugpy",
        "go-debug-adapter",
        "bash-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
