return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
      "saghen/blink.compat",
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
