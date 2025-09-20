return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  enabled = false,
  cmd = {
    "SupermavenUseFree",
    -- "SupermavenUsePro",
  },
  opts = {
    keymaps = {
      accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
    },
    disable_inline_completion = true,
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  },
}
