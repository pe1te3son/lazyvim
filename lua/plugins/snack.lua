-- stylua: ignore

return {
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      scroll = { enabled = false },
      picker = {
        win = {
          input = {
            keys = {
              ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
              ["d"] = { "bufdelete", mode = { "n"} },
            },
          },
          list = { keys = { ["dd"] = "bufdelete" } },
        },
      }
    },
    keys = {
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sp", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" , mode = { "n" }},
      { "<leader>sP", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sp", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "v" } },
      { "<leader>sl", function() Snacks.picker.resume() end, desc = "Resume", mode = { "n", "x"}},
      { "<leader>sL", function() Snacks.picker.loclist() end, desc = "Location List" },
    }
  },
}
