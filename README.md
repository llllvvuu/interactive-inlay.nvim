> ⚠️ **DO NOT USE - Requires an [extension to Neovim core](https://github.com/neovim/neovim/pull/25512)**

Access tooltips and code actions from inlay hints.

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

See `:h inlay_plus` for a full API reference.

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
- [ ] Make the tooltip floating window. Is it better to show a combined tooltip or cycle through the label parts' tooltips? Leave it open to a config option?
- [ ] Add a select menu to "click" on the label parts (how do we get there? press H twice? or separate hotkey?)
- [ ] Add inlay hint code actions to the code actions list (maybe a null-ls source?). Or maybe don't do this and just add this to the select menu?
- [ ] In VSCode there seem to be CodeLens inside the inlay hint tooltip, which is too giga-brain for me right now
- [ ] Mouse support?
