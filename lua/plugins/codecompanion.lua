return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    -- "franco-ruggeri/codecompanion-spinner.nvim",
  },
  opts = {
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools
          make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = false, -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true, -- Show tool results directly in chat buffer
          format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true, -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true, -- Add MCP prompts as /slash commands
        },
      },
    },
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
        },
        tools = {
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
            -- ["full_stack_dev_v2"] = {
            --   description = "Full Stack Developer - Can run code, edit code and modify files",
            --   tools = {
            --     "cmd_runner",
            --     "create_file",
            --     "file_search",
            --     "get_changed_files",
            --     "grep_search",
            --     "insert_edit_into_file",
            --     "list_code_usages",
            --     "read_file",
            --     "search_web",
            --   },
            --   opts = {
            --     collapse_tools = true,
            --   },
            -- },
          },
        },
      },
      inline = {
        adapter = "copilot",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
