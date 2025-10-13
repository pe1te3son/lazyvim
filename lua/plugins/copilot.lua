return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp",
      init = function()
        vim.g.copilot_nes_debounce = 500
        -- vim.keymap.set("n", "<tab>", function()
        --   local bufnr = vim.api.nvim_get_current_buf()
        --   local state = vim.b[bufnr].nes_state
        --   if state then
        --     -- Try to jump to the start of the suggestion edit.
        --     -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
        --     local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
        --       or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
        --     return nil
        --   else
        --     -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
        --     return "<C-i>"
        --   end
        -- end, { desc = "Accept Copilot NES suggestion", expr = true })
      end,
    },
    event = "BufReadPost",
    opts = function()
      require("copilot").setup({
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

        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>",
          },
        },
        suggestion = {
          enabled = false,
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
