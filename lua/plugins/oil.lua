return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    {
      "-",
      "<CMD>Oil<CR>",
      desc = "Open OIL",
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
