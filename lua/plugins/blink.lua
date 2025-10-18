return {
  {
    "saghen/blink.cmp",
    dependencies = {
      -- "Exafunction/codeium.nvim",
      -- "saghen/blink.compat",
      -- "supermaven-nvim",
      "fang2hou/blink-copilot",
    },
    opts = {
      cmdline = {
        enabled = false,
      },
      completion = {
        documentation = { window = { border = "single" } },
      },
      sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "supermaven", "codecompanion", "copilot" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        -- compat = { "supermaven" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            kind = "Copilot",
            score_offset = 0,
            async = true,
          },
          -- supermaven = {
          --   kind = "Supermaven",
          --   score_offset = 0,
          --   async = true,
          -- },
          -- codeium = {
          --   name = "Codeium",
          --   kind = "Codeium",
          --   score_offset = 0,
          --   module = "codeium.blink",
          --   async = true,
          --   enabled = function()
          --     -- print("Current filetype:", vim.bo.filetype)
          --     return vim.bo.filetype ~= "AvanteInput" and vim.bo.filetype ~= "copilot-chat"
          --   end,
          -- },
        },
      },
    },
  },
}
