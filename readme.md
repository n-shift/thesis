# My (not so) good configuration
Welp, at first, I would like to tell what differs my config from others. I use [nvim-plugnplay](https://github.com/nvim-plugnplay/pnp-cli.git) plugin manager. It is in alpha stage, yet I'm testing it already. This config proves the fact that pnp is usable.

## Structure
```
 .
 ├── after
 │  ├── filetype.lua
 │  └── queries
 │     ├── lua
 │     │  └── highlights.scm
 │     └── query
 │        └── highlights.scm
 ├── cfg.jsonc
 ├── init.lua
 │  ├── config
 │  │  ├── cmp.lua
 │  │  ├── gitsigns.lua
 │  │  ├── heirline.lua
 │  │  ├── highlighter.lua
 │  │  ├── kanagawa.lua
 │  │  ├── leap.lua
 │  │  ├── luasnip.lua
 │  │  ├── mappy.lua
 │  │  ├── marks.lua
 │  │  ├── neorg.lua
 │  │  ├── nvim-treesitter.lua
 │  │  ├── satellite.lua
 │  │  ├── sidebar-nvim.lua
 │  │  ├── surround.lua
 │  │  ├── telescope.lua
 │  │  └── vimtex.lua
 │  ├── core
 │  │  ├── init.lua
 │  │  ├── locale.lua
 │  │  └── options.lua
 │  ├── disable
 │  │  ├── init.lua
 │  │  ├── opts.lua
 │  │  ├── plugins.lua
 │  │  └── providers.lua
 │  ├── lsp.lua
 │  ├── manager
 │  │  ├── bufenter.lua
 │  │  ├── dirchanged.lua
 │  │  ├── init.lua
 │  │  └── null.lua
 │  ├── minimal
 │  │  ├── core
 │  │  │  └── options.lua
 │  │  ├── core.lua
 │  │  └── manager.lua
 │  ├── sections
 │  │  ├── buffers.lua
 │  │  └── hello.lua
 │  └── utils.lua
 ├── pnp.lock.json
 └── readme.md
```
