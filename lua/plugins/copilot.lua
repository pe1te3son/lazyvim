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
        javascript = true,
        typescript = true,
        markdown = true,
        python = true,
        go = true,
        lua = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end
          return true
        end,
        ["*"] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      nes = {
        enabled = true,
        auto_trigger = true,
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
    },
  },
}
