local util = require("lspconfig.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      eslint = {
        root_dir = function(fname)
          return util.root_pattern(".git")(fname) or util.path.dirname(fname)
        end,
      },

      vtsls = {
        root_dir = util.root_pattern(".git"),
        typescript = {
          preferences = {
            importModuleSpecifier = "relative",
            quoteStyle = "single",
          },
        },
      },
      lexical = {
        cmd = { "/home/dan/Sources/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
        root_dir = function(fname)
          return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
        end,

        filetypes = { "elixir", "eelixir", "heex" },
      },
    },
  },
}
