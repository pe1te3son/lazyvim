-- stylua: ignore

return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
    keys = {
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sp", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" , mode = { "n", "x" }},
      { "<leader>sP", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sp", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "v" } },
      { "<leader>sl", function() Snacks.picker.resume() end, desc = "Resume", mode = { "n", "x"}},
      { "<leader>sL", function() Snacks.picker.loclist() end, desc = "Location List" },
    }
  },
}
