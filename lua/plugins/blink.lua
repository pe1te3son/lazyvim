return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
      "saghen/blink.compat",
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      completion = {
        -- menu = { border = "single" },
        documentation = { window = { border = "single" } },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "codeium", "codecompanion" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        providers = {
          avante = {
            enabled = false,
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
          codeium = {
            name = "Codeium",
            kind = "Codeium",
            score_offset = 0,
            module = "codeium.blink",
            async = true,
            enabled = function()
              -- print("Current filetype:", vim.bo.filetype)
              return vim.bo.filetype ~= "AvanteInput"
                and vim.bo.filetype ~= "AvantePromptInput"
                and vim.bo.filetype ~= "DressingInput"
                and vim.bo.filetype ~= "copilot-chat"
            end,
          },
        },
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "supermaven-nvim", "saghen/blink.compat" },
  --   opts = {
  --     sources = {
  --       compat = { "supermaven" },
  --       providers = {
  --         supermaven = {
  --           kind = "Supermaven",
  --           score_offset = 0,
  --           async = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "fang2hou/blink-copilot" },
  --   opts = {
  --     sources = {
  --       default = { "copilot" },
  --       providers = {
  --         copilot = {
  --           name = "copilot",
  --           module = "blink-copilot",
  --           score_offset = 0,
  --           async = true,
  --         },
  --       },
  --     },
  --   },
  -- },
}
