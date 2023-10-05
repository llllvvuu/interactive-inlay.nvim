local M = {}

local function word_range()
  local start_pos = vim.fn.searchpos("\\<", "bcnW")
  -- give one extra character, for parameter inlay hints
  start_pos[2] = start_pos[2] > 0 and start_pos[2] - 1 or 0
  local end_pos = vim.fn.searchpos("\\>", "cnW")
  return start_pos, end_pos
end

M.inlay_tooltip_at_cursor_word = function()
  local start_pos, end_pos = word_range()
  local range = { start = start_pos, ["end"] = end_pos }
  local hints = vim.lsp.inlay_hint.get({ range = range })
  vim.print(hints)
end

return M
