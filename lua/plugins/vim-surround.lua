return {
  "tpope/vim-surround",
  -- event = "VeryLazy",
  keys = {
    { "cs", "<Plug>VSurround", mode = { "n" }, desc = "Change Surrounding" },
    { "ds", "<Plug>Dsurround", mode = { "n" }, desc = "Delete Surrounding" },
    { "ys", "<Plug>Ysurround", mode = { "n" }, desc = "Add Surrounding" },
    { "S", "<Plug>VSurround", mode = { "v" }, desc = "Add Surrounding (Visual)" },
    { "yss", "<Plug>Yssurround", mode = { "n" }, desc = "Add Surrounding (Line)" },
    { "yS", "<Plug>YSsurround", mode = { "n" }, desc = "Add Surrounding (Block)" },
    { ".", "<Plug>SurroundRepeat", mode = { "n" }, desc = "Repeat Last Surround" },
  },
  dependencies = { "tpope/vim-repeat" },
}
