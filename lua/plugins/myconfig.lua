-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore


return {
  { "rebelot/kanagawa.nvim",
    opts = {
      -- compile = false,  -- enable compiling the colorscheme
      -- undercurl = true, -- enable undercurls
      -- commentStyle = { italic = true },
      -- functionStyle = {},
      -- keywordStyle = { italic = true },
      -- statementStyle = { bold = true },
      -- typeStyle = {},
      -- transparent = false,   -- do not set background color
      -- dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
      -- colors = {             -- add/modify theme and palette colors
      --   palette = {},
      --   theme = {
      --     wave = {},
      --     lotus = {},
      --     dragon = {},
      --     all = {
      --       ui = {
      --         bg_gutter = "none"
      --       }
      --     }
      --   },
      -- },
      -- overrides = function(colors) -- add/modify highlights
      --   return {}
      -- end,
      theme = "wave",  -- Load "wave" theme when 'background' option is not set
      background = {   -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
      },
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
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
