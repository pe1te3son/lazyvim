-- return {}
return {
  "pe1te3son/prev-buffer.nvim",
  keys = {
    { "<leader>bd", desc = "Delete current buffer and switch to last" },
    { "<leader><Tab>", desc = "Switch to last buffer" },
  },
  opts = {},
  config = function(_, opts)
    require("prev-manager").setup(opts)
  end,
}
