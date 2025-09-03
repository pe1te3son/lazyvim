return {
  enabled = true,
  opts = {
    keymap = "gh",
    save_chat_keymap = "sc",
    auto_save = true,
    expiration_days = 30,
    picker = "snacks",
    chat_filter = function(chat_data)
      return chat_data.cwd == vim.fn.getcwd()
    end,
    picker_keymaps = {
      rename = { n = "r", i = "<C-r>" },
      delete = { n = "d", i = "<C-x>" },
      duplicate = { n = "<C-y>", i = "<C-y>" },
    },
    auto_generate_title = true,
    title_generation_opts = {
      adapter = "copilot",
      model = "gpt-4.1",
      refresh_every_n_prompts = 0,
      max_refreshes = 3,
      format_title = function(original_title)
        local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        if not cwd or cwd == "" then
          return original_title
        end
        return string.format("%s — 󱉭 %s", original_title or "", cwd)
      end,
    },
    continue_last_chat = false,
    delete_on_clearing_chat = false,
    dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
    enable_logging = false,
    summary = {
      create_summary_keymap = "<leader>ag",
      browse_summaries_keymap = "<leader>ab",
      generation_opts = {
        adapter = "copilot",
        model = "gpt-4.1",
        context_size = 90000,
        include_references = true,
        include_tool_outputs = true,
      },
    },
    memory = {
      auto_create_memories_on_summary_generation = true,
      vectorcode_exe = "vectorcode",
      tool_opts = { default_num = 10 },
      notify = true,
      index_on_startup = false,
    },
  },
}
