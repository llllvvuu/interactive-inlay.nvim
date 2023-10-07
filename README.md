> ⚠️ **DO NOT USE - Requires an [extension to Neovim core](https://github.com/neovim/neovim/pull/25512)**

Access tooltips and code actions from inlay hints.

<img width="1508" alt="Screenshot 2023-10-06 at 3 54 57 AM" src="https://github.com/llllvvuu/interactive-inlay.nvim/assets/5601392/92f9b5d0-04b2-4209-bbba-02d66c15d586">

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "llllvvuu/interactive-inlay.nvim",
  keys = {
    -- change if you use H/M/L
    { "H", require("interactive-inlay").inlay_tooltip_at_cursor_word }
  }
}
```

## Default Configuration
```lua
{
  -- TODO: extend_code_actions_list = true,
}
```

## API Quickstart

See `:h interactive-inlay` for a full API reference.

```lua
require("interactive-inlay").inlay_tooltip_at_cursor_word()
-- TODO: require("interactive-inlay").inlay_tooltip_at_cursor_WORD()
-- TODO: require("interactive-inlay").inlay_tooltip_at_cursor_node()
-- TODO: require("interactive-inlay").inlay_tooltip_at_cursor_exact()
-- TODO?: require("interactive-inlay").inlay_tooltip_at_cursor_dwim()
```

`inlay_tooltip_at_*` methods will pop up the tooltip for the first matching inlay hint
(i.e. earliest in document)

## Roadmap

Currently the plugin just `vim.print`s the inlay hints (see `:messages`). Next, we need to:

- [ ] Less bad detection of parameter inlay hints (maybe requires `inlay_tooltip_at_cursor_dwim`). But parameter tooltips are quite useless, so maybe this case isn't important.
- [x] tooltip floating window MVP
- [ ] combined hover/tooltip (or is it better to cycle through the label parts' tooltips? leave it open to a config option?)
- [ ] Add a select menu to "click" on the label parts. Probably do like rust-tools.nvim, H twice to enter, first N lines are `<Enter>`-able. Maybe also, if not combined tooltip, then when cursor goes over each part it opens that part's tooltips/hovers
- [ ] Add `textEdits` and label part `command`s to the code actions list (maybe a null-ls source?). Or maybe don't do this and just add this to the select menu?
- [ ] Navigation between inlay hints (e.g. "]i", "[i", leap.nvim, Telescope)
- [ ] Mouse support?
