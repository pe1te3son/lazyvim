-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del({ "n" }, "<leader><tab>l")
vim.keymap.del({ "n", "v" }, "<leader>sw")
vim.keymap.del({ "n" }, "<leader>e")
vim.keymap.del({ "n" }, "<leader>sg")
vim.keymap.del({ "n", "v" }, "<leader>sr") -- search and replace grup far plugin
vim.keymap.del({ "n" }, "<leader><space>")
vim.keymap.set("n", "q", "<nop>") -- delete macro recording key
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>w", { desc = "Cycle to next window" })
vim.keymap.set("n", "<C-l>", "<C-w>W", { desc = "Cycle to previous window" })

-- vim.cmd([[cab cc CodeCompanion]])
vim.keymap.set({ "v", "n" }, "<leader>ap", [[:CodeCompanion<CR>]], { desc = " Prompt (Code Companion)" })

vim.keymap.set({ "n" }, "<leader>aa", [[:CodeCompanionAction<CR>]], { desc = " Actions (Code Companion)" })

vim.keymap.set("n", "<leader>at", "<Cmd>CodeCompanionChat Toggle<CR>", {
  desc = " Chat (Code Companion)",
})

-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>qr", "q", { desc = "Start recording macro" })

vim.keymap.set({ "n" }, "<leader><space>", function()
  require("fzf-lua").keymaps()
end, { desc = "FzfLua keymaps" })

vim.keymap.set({ "n" }, "<leader>fk", function()
  require("fzf-lua").builtin()
end, { desc = "FzfLua All" })

vim.keymap.set({ "n", "v" }, "<leader>sx", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, {
  desc = "Search and replace (Grug Far)",
})
-- vim.keymap.set({ "v" }, "<leader>sr", [[hy:%s/<C-r><C-w>//gc<left><left><left>]], {
--   desc = "Cmd: Search and replace (current file)",
-- })

vim.keymap.set(
  { "v" },
  "<leader>sr",
  [["hy<Esc>:%s/<C-r>=escape(@h, '/\')<CR>//gc<left><left><left>]],
  { desc = "Search and replace selection (Current File)" }
)

vim.keymap.set("n", "<C-n>", function(ctx)
  require("trouble").next({ skip_groups = true, jump = true }, ctx)
end, { noremap = true })
vim.keymap.set("n", "<C-p>", function(ctx)
  require("trouble").prev({ skip_groups = true, jump = true }, ctx)
end, { noremap = true })

vim.keymap.set("i", "<C-u>", function()
  require("copilot.suggestion").accept_word()
end, { remap = false, desc = "Accept Copilot suggestion (Word)" })

vim.keymap.set("i", "<C-l>", function()
  require("copilot.suggestion").next()
end, { remap = false, desc = "Next Copilot suggestion" })

vim.keymap.set("i", "<C-L>", function()
  require("copilot.suggestion").prev()
end, { remap = false, desc = "Prev Copilot suggestion" })

-- fugitive keymaps
-- vim.keymap.set("n", "<leader>gii", function()
--   vim.cmd("vertical rightbelow Git")
-- end)
vim.keymap.set("n", "<leader>gid", function()
  vim.cmd("normal! m'") -- Set a mark at current position
  vim.cmd.Gdiff()
  -- Set up an autocmd to return to mark when diff is closed
  vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    once = true,
    callback = function()
      vim.schedule(function()
        if vim.fn.mode() == "n" then
          vim.cmd("normal! `'")
        end
      end)
    end,
  })
end, { desc = "Git Diff" })
