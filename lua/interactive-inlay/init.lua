local M = {}

local methods = vim.lsp.protocol.Methods

--- @return lsp.Range
local function word_range()
  local start_line, start_col = unpack(vim.fn.searchpos("\\<", "bcnW"))
  local end_line, end_col = unpack(vim.fn.searchpos("\\>", "cnW"))
  return {
    -- vim is 1-indexed, lsp is 0-indexed
    -- HACK: add one character to the beginning in case the inlay hint is placed before the word
    start = { line = start_line - 1, character = start_col - 1 },
    ["end"] = { line = end_line - 1, character = end_col },
  }
end

--- @param range lsp.Range
M.inlay_tooltip_at_range = function(range)
  local hint = vim.lsp.inlay_hint.get({ bufnr = 0, range = range })[1]
  if not hint then
    return
  end

  local client = vim.lsp.get_clients({
    bufnr = hint.bufnr,
    client_id = hint.client_id,
    method = methods.textDocument_inlayHint,
  })[1]
  client.request(
    methods.inlayHint_resolve,
    hint.inlay_hint,
    --- @param inlay_hint lsp.InlayHint
    function(_, inlay_hint)
      -- TODO: also add inlay_hint.tooltip
      -- TODO: also add inlay_hint.label[].tooltip
      -- TODO: also show some stuff about what textEdits/commands/lenses are available
      if not inlay_hint then return end
      local label = inlay_hint.label
      if type(label) == "table" then
        local parts = vim.tbl_filter(function(part)
          return part.location ~= nil
        end, label)
        -- TODO: merge all hovers
        local part = parts[1]
        if part then
          -- FIXME: for some reason this enters the floating window
          client.request(methods.textDocument_hover, {
            textDocument = { uri = part.location.uri },
            position = part.location.range.start,
          })
        end
      end
    end,
    hint.bufnr
  )
end

M.inlay_tooltip_at_cursor_word = function()
  M.inlay_tooltip_at_range(word_range())
end

return M
