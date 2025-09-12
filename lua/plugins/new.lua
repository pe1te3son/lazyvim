return {
  {
    dir = "~/Projects/nvim-cc-spinner",
    config = function()
      require("nvim-cc-spinner").setup()
    end,
  },
  {
    "Davidyz/VectorCode",
    version = "*", -- optional, depending on whether you're on nightly or release
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "VectorCode", -- if you're lazy-loading VectorCode
  },
  -- "tris203/precognition.nvim",
  -- opts = {
  -- },
}
