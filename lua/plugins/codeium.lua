return {
  "Exafunction/codeium.nvim",
  -- enabled = false,
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    workspace_root = {
      use_lsp = true,
    },
    enable_chat = false,
    enable_cmp_source = vim.g.ai_cmp,
    virtual_text = {
      -- default_filetype_enabled = false,
      enabled = not vim.g.ai_cmp,
      filetypes = {
        copilot = false,
        ["copilot-chat"] = false,
        markdown = false,
        AvanteInput = false,
      },
      key_bindings = {
        accept = "<Tab>",
        accept_word = "<C-j>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
  },
}
