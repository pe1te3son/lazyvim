return {
  {
    "copilotlsp-nvim/copilot-lsp",
    event = "VeryLazy",
    config = function()
      require("copilot-lsp").setup()
    end,
    init = function()
      vim.g.copilot_nes_debounce = 1000
      vim.lsp.enable("copilot_ls")
      vim.keymap.set("n", "<tab>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = vim.b[bufnr].nes_state
        if state then
          -- Try to jump to the start of the suggestion edit.
          -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
          local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
            or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
          return nil
        else
          -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
          return "<C-i>"
        end
      end, { desc = "Accept Copilot NES suggestion", expr = true })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    -- event = "InsertEnter",
    event = "BufReadPost",
    opts = {
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
