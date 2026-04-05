# Neovim Configuration

A clean, minimal NvChad-based configuration focused on C++/Python development.

## Stack

| Component | Tool |
|-----------|------|
| Base | [NvChad](https://github.com/NvChad/NvChad) v2.5 |
| Theme | Catppuccin |
| Package Manager | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| LSP | nvim-lspconfig + Mason |
| Formatter | conform.nvim |
| Tree-sitter | nvim-treesitter |

## Key Features

- **Languages**: C++, Python, Lua, HTML/CSS
- **Format on write** via `conform.nvim` (stylua, clang-format, ruff, prettier)
- **LeetCode integration** — solve and submit problems in `~/leetcode/`
  - `<leader>lt` — test solution
  - `<leader>ls` — submit solution
- **Git diff viewer** via `diffview.nvim`
  - `<leader>gd` — toggle diff view
- **Code folding** — indent-based, all folds open by default
- **Relative line numbers**
- **Space as leader key**

## Key Bindings

| Mode | Mapping | Action |
|------|---------|--------|
| n | `jk` | Exit insert mode |
| n | `;` | Enter command mode |
| n | `<C-t>` | New tab |
| n | `<C-w>` | Close tab |
| n | `<leader>tn` | Next tab |
| n | `<leader>tp` | Previous tab |
| n | `<A-j>` / `<A-k>` | Move line down/up |
| v | `<A-j>` / `<A-k>` | Move selection down/up |

## Structure

```
.
├── init.lua              # Bootstrap + lazy.nvim setup
├── lua/
│   ├── chadrc.lua        # NvChad overrides (theme)
│   ├── options.lua       # Editor options
│   ├── mappings.lua      # Key bindings
│   ├── autocmds.lua      # Autocommands (LeetCode boilerplate injection)
│   ├── plugins/
│   │   └── init.lua      # Plugin declarations
│   └── configs/
│       ├── lazy.lua      # Lazy plugin settings
│       ├── lspconfig.lua # LSP servers + Mason
│       ├── conform.lua   # Formatter config
│       └── treesitter.lua # Tree-sitter parsers
└── spell/                # Custom spell dictionary
```
