return {
  ["cmd_runner"] = {
    opts = {
      requires_approval = true,
    },
  },
  opts = {
    default_tools = {},
    auto_submit_errors = true,
    auto_submit_success = true,
  },
  groups = {
    ["guru"] = {
      tools = {
        -- "vectorcode_ls",
        -- "vectorcode_query",
        "cmd_runner",
        "file_search",
        "get_changed_files",
        "grep_search",
        "list_code_usages",
        "read_file",
        "search_web",
        "create_file",
        "insert_edit_into_file",
      },
      opts = {
        collapse_tools = true,
      },
    },
    ["plan"] = {
      prompt = "I'm giving you access to the ${tools} to help you perform coding tasks",
      tools = {
        "cmd_runner",
        "file_search",
        "get_changed_files",
        "grep_search",
        "list_code_usages",
        "read_file",
        "search_web",
      },
      opts = {
        collapse_tools = true,
      },
    },
    ["build"] = {
      prompt = "I'm giving you access to the ${tools} to help you perform coding tasks",
      tools = {
        "create_file",
        "insert_edit_into_file",
      },
      opts = {
        collapse_tools = true,
      },
    },
  },
}

