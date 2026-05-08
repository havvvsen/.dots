---@type LazySpec
return {

  -- Discord Presence --
  --
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- Wakatime Metrics --
  --
  { "wakatime/vim-wakatime", lazy = false },

  -- Dashboard --
  --
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {},
          header = "→ Welcome back Hansen\n\n\nIf you don't do it, someone else will",
        },

        sections = {
          {
            section = "header",
          },
        },
      },
    },
  },
}
