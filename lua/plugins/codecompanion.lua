return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    -- "franco-ruggeri/codecompanion-spinner.nvim",
  },
  opts = {
    prompt_library = require("codecompanion.prompt_library"),
    display = {
      chat = {
        show_settings = false, -- Show LLM settings at the top of the chat buffer?
      },
    },
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
          model = "gpt-5-mini",
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
          groups = {},
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
