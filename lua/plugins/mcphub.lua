return {

  "ravitemer/mcphub.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "bundled_build.lua", -- Bundles `mcp-hub` binary along with the neovim plugin
  config = function()
    require("mcphub").setup({
      global_env = {
        -- set in zshrc
      },
      auto_approve = false,
    })
  end,
}
