return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
      "saghen/blink.compat",
      "fang2hou/blink-copilot",
    },
    opts = {
      completion = {
        -- menu = { border = "single" },
        documentation = { window = { border = "single" } },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "codeium", "codecompanion", "copilot" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 0,
            async = true,
          },
          codeium = {
            name = "Codeium",
            kind = "Codeium",
            score_offset = 0,
            module = "codeium.blink",
            async = true,
            enabled = function()
              -- print("Current filetype:", vim.bo.filetype)
              return vim.bo.filetype ~= "AvanteInput" and vim.bo.filetype ~= "copilot-chat"
            end,
          },
        },
      },
    },
  },
}
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
