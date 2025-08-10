return {
  "tpope/vim-surround",
  -- event = "VeryLazy",
  keys = {
    { "cs", "<Plug>VSurround", mode = { "n", "x" }, desc = "Change Surrounding" },
    { "ds", "<Plug>Dsurround", mode = { "n", "x" }, desc = "Delete Surrounding" },
    { "ys", "<Plug>Ysurround", mode = { "n", "x" }, desc = "Add Surrounding" },
    { "yss", "<Plug>Yssurround", mode = { "n" }, desc = "Add Surrounding (Line)" },
    { "yS", "<Plug>YSsurround", mode = { "n" }, desc = "Add Surrounding (Block)" },
  },
}
