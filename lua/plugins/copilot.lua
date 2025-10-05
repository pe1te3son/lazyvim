return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      {
        "copilotlsp-nvim/copilot-lsp",
        init = function()
          vim.g.copilot_nes_debounce = 2000
        end,
      },
    },
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- suggestion = { enabled = false },
      -- panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
    config = function()
      require("copilot").setup({
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>au",
            accept = false,
            dismiss = "<Esc>",
          },
        },
        suggestion = {
          enabled = true,
          keymap = {
            accept = "<Tab>",
            accept_word = "<C-j>",
            accept_line = false,
            next = "<C-l>",
            prev = "<C-L>",
          },
        },
      })
    end,
  },
}
