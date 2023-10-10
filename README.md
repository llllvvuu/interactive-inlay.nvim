> ⚠️ **DO NOT USE - Requires an [extension to Neovim core](https://github.com/neovim/neovim/pull/25512)**
> 🚧 **WIP** 🚧

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

## Roadmap

### Selection Options
- [ ] word
- [ ] WORD
- [ ] node
- [ ] textobject
- [ ] smart
- [ ] line
- [ ] visible_area
- [ ] buffer
- [ ] workspace

### Native Neovim UI
- [x] open first label part in `vim.lsp.util.open_floating_preview`
- [ ] pick and execute `command` with `vim.ui.select`
- [ ] pick and execute `command` from floating preview
- [ ] jump to `location` from floating preview
- [ ] apply `textEdits` from floating preview
- [ ] open `loclist` with `label[].location`s

### Telescope extension
Label Part Preview:
- [ ] Parent's tooltip
- [ ] Diff preview of parent's `textEdits` (like actions-preview.nvim)
- [ ] `label[].text`
- [ ] `label[].command` ("Command Available: {command}")
- [ ] `textDocument/hover` at the `label[].location`

Actions:
- [ ] `<Enter>` to jump
- [ ] `<C-Enter>` to apply `textEdits`
- [ ] `<M-Enter>` to apply `command`

### Navigation
- [ ] `]i`, `[i`
- [ ] leap.nvim

### Mouse Support
- [ ] `<C-LeftMouse>` to jump
- [ ] Mouse hover to show floating preview
