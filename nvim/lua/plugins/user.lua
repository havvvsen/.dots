---@type LazySpec
return {

  -- Discord Presence --
  --
  {
    "vyfor/cord.nvim",
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
