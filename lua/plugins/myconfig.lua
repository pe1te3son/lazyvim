-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore


return {
  {
    "folke/flash.nvim",
      enabled = false
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sp", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" , mode = { "n", "x" }},
      { "<leader>sP", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sp", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "v" } },
    }

  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      { "<leader>el", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    }
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "kanagawa",
  --   },
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-sonnet-4",
      -- See Configuration section for options
    },
  },
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = false })
      vim.api.nvim_set_keymap("n", "<leader>ar", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>ar", group = "ranger" },
      },
    },
  },
}
