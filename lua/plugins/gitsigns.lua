return {
  -- { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },

      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>gis", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>gir", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>giS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>giu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>giR", gs.reset_buffer, "Reset Buffer")
        -- map("n", "<leader>gip", gs.preview_hunk_inline, "Preview Hunk Inline")
        -- map("n", "<leader>gib", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gib", function() gs.blame() end, "Blame Buffer")
        -- map("n", "<leader>gid", gs.diffthis, "Diff This")
        -- map("n", "<leader>giD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
