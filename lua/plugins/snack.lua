-- stylua: ignore

return {
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      scroll = { enabled = false },
      picker = {
        ui_select = true,
        win = {
          input = {
            keys = {
              ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
              ["d"] = { "bufdelete", mode = { "n"} },
            },
          },
          list = { keys = { ["dd"] = "bufdelete" } },
        },
      }
    },
    keys =  {
      { "<leader><space>", LazyVim.pick("files", {root = false}), desc = "Find Files (Root Dir)" },
        { "<leader>sf", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find Files (In buffer dir)" },
      { "<leader>sF", LazyVim.pick("files", { root = true }), desc = "Find Files (Root Dir)" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sp", LazyVim.pick("live_grep", { root = false }), desc = "Grep (Cwd)" , mode = { "n" }},
      { "<leader>sP", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sp", LazyVim.pick("grep_word", { root = false }), desc = "Visual selection or word (Cwd)", mode = { "v" } },
      { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root)", mode = {"n"} },
      { "<leader>sG", LazyVim.pick("grep_word"), desc = "Grep Visual (Root)", mode = {"v"}},
      { "<leader>sl", function() Snacks.picker.resume() end, desc = "Resume", mode = { "n", "x"}},
      { "<leader>sL", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      -- Search in current buffer's directory
      { "<leader>sd", function() 
        Snacks.picker.grep({ dirs = { vim.fn.expand("%:p:h") } })
      end, desc = "Grep in Buffer Dir", mode = {"n"} },
      { "<leader>sd", function() 
        Snacks.picker.grep_word({ dirs = { vim.fn.expand("%:p:h") } })
      end, desc = "Grep Word in Buffer Dir", mode = {"v"} },
      -- Search in selected directory
      { "<leader>sD", function()
        -- Use fzf-lua to select directory, then grep in it with Snacks
        require('fzf-lua').fzf_exec("rg --files --null | xargs -0 dirname | sort -u", {
          prompt = "Select Directory> ",
          actions = {
            ['default'] = function(selected)
              if selected and selected[1] then
                Snacks.picker.grep({ dirs = { selected[1] } })
              end
            end
          }
        })
      end, desc = "Grep in Selected Dir", mode = {"n"} },
      { "<leader>sD", function()
        require('fzf-lua').fzf_exec("rg --files --null | xargs -0 dirname | sort -u", {
          prompt = "Select Directory> ",
          actions = {
            ['default'] = function(selected)
              if selected and selected[1] then
                Snacks.picker.grep_word({ dirs = { selected[1] } })
              end
            end
          }
        })
      end, desc = "Grep Word in Selected Dir", mode = {"v"} },
    }
  },
}
