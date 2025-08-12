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

local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "<leader>h", function()
  hop.hint_char1({
    direction = directions.AFTER_CURSOR,
    current_line_only = false,
    case_insensitive = true,
  })
end, { desc = "Hop After Cursor", remap = true })
vim.keymap.set("", "<leader>t", function()
  hop.hint_char1({
    direction = directions.BEFORE_CURSOR,
    current_line_only = false,
    case_insensitive = true,
  })
end, { desc = "Hop Before Cursor", remap = true })

-- Copilot
vim.keymap.set("n", "<leader>am", ":CopilotChatModels<cr>", {
  desc = "Select Copilot Model",
})

vim.keymap.set("i", "<C-u>", function()
  require("copilot.suggestion").accept_word()
end, { remap = false, desc = "Accept Copilot suggestion (Word)" })

vim.keymap.set("i", "<C-l>", function()
  require("copilot.suggestion").next()
end, { remap = false, desc = "Next Copilot suggestion" })

vim.keymap.set("i", "<C-L>", function()
  require("copilot.suggestion").prev()
end, { remap = false, desc = "Prev Copilot suggestion" })

-- -- fugitive keymaps
-- vim.keymap.set("n", "<leader>gii", function()
--   vim.cmd("vertical rightbelow Git")
-- end)
-- vim.keymap.set("n", "<leader>gid", vim.cmd.Gdiff)
--
-- vim.keymap.set("n", "<leader>gia", function()
--   vim.cmd("diffput")
-- end)
--
-- -- vim.keymap.set("n", "<leader>gib", function()
-- --   vim.cmd("Git blame")
-- -- end)
--
-- spacemacs like buffer management
vim.keymap.set("n", "<leader>bd", "<Cmd>:bd<CR>", {
  desc = "Delete current buffer",
})
local function find_last_buffer_listed()
  local all_buffers = vim.api.nvim_list_bufs()
  local current_buffer = vim.api.nvim_get_current_buf()
  local local_buffers = {}

  for _, buf in ipairs(all_buffers) do
    if vim.api.nvim_get_option_value("buflisted", { buf = buf }) then
      if buf ~= 1 and buf ~= current_buffer then
        table.insert(local_buffers, buf)
      end
    end
  end

  if #local_buffers > 0 then
    return local_buffers[#local_buffers]
  end
end

local function switch_to_last_buffer()
  local prev_bufnr = vim.api.nvim_eval('bufnr("#")')

  -- if there is no previous buffer then nothing to do
  if prev_bufnr == -1 then
    return
  end

  if vim.api.nvim_get_option_value("buflisted", { buf = prev_bufnr }) then
    return vim.api.nvim_set_current_buf(prev_bufnr)
  end

  local last_on_list = find_last_buffer_listed()
  if last_on_list then
    vim.api.nvim_set_current_buf(last_on_list)
  end
end

-- local function delete_buffer_by_id(buffer_id)
--   vim.api.nvim_command("bdelete " .. buffer_id)
-- end
--
-- local function is_modified(bufnr)
--   return vim.api.nvim_get_option_value("modified", { buf = bufnr })
-- end

-- vim.keymap.set("n", "<leader>bd", function()
--   local current_buffer = vim.api.nvim_get_current_buf()
--
--   if is_modified(current_buffer) then
--     print("Buffer has unsaved changes.")
--     return
--   end
--
--   switch_to_last_buffer()
--   delete_buffer_by_id(current_buffer)
-- end)

vim.keymap.set("n", "<leader><Tab>", function()
  switch_to_last_buffer()
end)
