-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "copilot-chat",
  callback = function()
    vim.schedule(function()
      vim.bo.modifiable = true
      vim.bo.readonly = false
    end)
  end,
})

-- Clear yanky history on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require("yanky.history").clear()
  end,
})

-- Auto-save using timer (doesn't affect updatetime)
local autosave_timer = vim.loop.new_timer()
local function autosave_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if
      vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_get_option_value("modified", { buf = buf })
      and vim.api.nvim_buf_get_name(buf) ~= ""
      and not vim.api.nvim_get_option_value("readonly", { buf = buf })
      and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
    then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! write")
      end)
      local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
      vim.notify(string.format("Saved: %s", filepath), vim.log.levels.INFO, { title = "Auto-save" })
    end
  end
end

-- Start timer that repeats every 60 seconds
autosave_timer:start(60000, 60000, vim.schedule_wrap(autosave_buffers))
