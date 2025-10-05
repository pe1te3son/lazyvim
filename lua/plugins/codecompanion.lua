return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
    {
      "pe1te3son/nvim-cc-spinner",
      config = function()
        require("nvim-cc-spinner").setup()
      end,
    },
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-sonnet-4.5",
              -- default = "gpt-4.1",
            },
          },
        })
      end,
      http = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN,
            },
          })
        end,
      },
    },
    prompt_library = require("codecompanion.prompt_library"),
    display = {
      chat = {
        show_settings = false, -- Show LLM settings at the top of the chat buffer?
      },
    },
    extensions = {
      -- vectorcode = {
      --   opts = {
      --     tool_group = {
      --       -- this will register a tool group called `@vectorcode_toolbox` that contains all 3 tools
      --       enabled = true,
      --       -- a list of extra tools that you want to include in `@vectorcode_toolbox`.
      --       -- if you use @vectorcode_vectorise, it'll be very handy to include
      --       -- `file_search` here.
      --       extras = {
      --         "file_search",
      --       },
      --       collapse = false, -- whether the individual tools should be shown in the chat
      --     },
      --   },
      -- },
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
      -- History extension: persist chats across Neovim restarts
      history = require("codecompanion.history"),
    },
    strategies = {
      chat = {
        roles = {
          llm = function(adapter)
            -- print(vim.inspect(adapter))
            return "CodeCompanion (" .. adapter.formatted_name .. " - " .. adapter.model.name .. ")"
          end,
          user = "Me",
        },
        -- adapter = "claude_code",
        adapter = "copilot",
        -- adapter = {
        --   name = "copilot",
        --   model = "gpt-5-mini",
        -- },
        tools = require("codecompanion.tools"),
      },
      inline = {
        -- adapter = "claude_code",
        adapter = "copilot",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
