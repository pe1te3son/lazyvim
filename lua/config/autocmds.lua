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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "copilot-*",
  callback = function(args)
    -- Set display options immediately
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0

    -- Use a more aggressive approach for modifiable/readonly
    vim.defer_fn(function()
      local buf = args.buf
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(function()
          vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
          vim.api.nvim_set_option_value("readonly", false, { buf = buf })
        end)
      end
    end, 10) -- Small delay to let CopilotChat initialize
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
local vim_has_focus = true

local function autosave_buffers()
  local current_buf = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local should_save_current = not vim_has_focus -- Save current buffer if vim is unfocused

    if
      vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_get_option_value("modified", { buf = buf })
      and vim.api.nvim_buf_get_name(buf) ~= ""
      and not vim.api.nvim_get_option_value("readonly", { buf = buf })
      and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
      and (buf ~= current_buf or should_save_current)
    then
      -- Skip if any window displaying this buffer is in insert mode
      local skip_buffer = false
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
          local mode = vim.api.nvim_get_mode().mode
          if mode:match("^i") and vim_has_focus then -- Only skip insert mode when focused
            skip_buffer = true
            break
          end
        end
      end

      if not skip_buffer then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("silent! write")
        end)
        local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
        vim.notify(string.format("Saved: %s", filepath), vim.log.levels.INFO, { title = "Auto-save" })
      end
    end
  end
end

vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim_has_focus = true
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    vim_has_focus = false
  end,
})

local autosave_seconds = 120
if autosave_timer ~= nil then
  autosave_timer:start(autosave_seconds * 1000, autosave_seconds * 1000, vim.schedule_wrap(autosave_buffers))
end
