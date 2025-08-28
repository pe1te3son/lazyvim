return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    ---@type opencode.Config
    opts = {
      -- Your configuration, if any
    },
    -- stylua: ignore
    keys = {
      -- { '<leader>at', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
      { '<leader>ad', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
      { '<leader>ad', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
      { '<leader>as', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
      -- { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
      -- { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
      -- { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
      -- { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "zbirenbaum/copilot.lua" },
    },
    build = "make tiktoken",
    opts = function()
      local user = "User"
      return {
        auto_insert_mode = false,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        -- model = "claude-sonnet-4",
        model = "gpt-5-mini",
        window = {
          layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
          width = 0.8,
          height = 0.8,
        },
      }
    end,
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>at",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input .. " #buffer")
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n" },
      },

      {
        "<leader>ap",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input .. " #selection")
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "v" },
      },
      {
        "<leader>ax",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
    },
  },
}
