# Neovim Configuration

This document provides a detailed overview of the Neovim configuration, its structure, and the function of each file and folder. The configuration is based on NvChad and has been refactored for clarity, maintainability, and performance.

## Project Structure

The configuration is organized into the following files and directories:

```
.
├── lua/
│   ├── autocmds.lua
│   ├── chadrc.lua
│   ├── mappings.lua
│   ├── options.lua
│   ├── configs/
│   │   ├── conform.lua
│   │   ├── lazy.lua
│   │   ├── lspconfig.lua
│   │   ├── treesitter.lua
│   │   └── ufo.lua
│   └── plugins/
│       └── init.lua
└── README.md
```

## Core Configuration Files

These files are located in the root of the `lua` directory and control the core behavior of Neovim.

*   **`chadrc.lua`**: This is the main configuration file for NvChad. It allows you to override the default NvChad settings. In this configuration, it's used to set the theme to `catppuccin`.

*   **`options.lua`**: This file sets a variety of Neovim's built-in options. It's used to configure things like indentation, mouse behavior, and other editor settings.

*   **`mappings.lua`**: This file defines all the custom key mappings. It's used to create shortcuts for common actions and to override default key bindings.

*   **`autocmds.lua`**: This file contains all the autocommands. Autocommands are used to automatically execute commands when certain events occur, such as opening a file or saving a buffer.

## Plugin Configuration (`configs/`)

The `configs` directory contains the configuration for all the plugins. Each plugin has its own file, which makes it easy to manage and update the plugin settings.

*   **`conform.lua`**: This file configures the `stevearc/conform.nvim` plugin, which is used for code formatting. It defines the formatters to be used for different file types.

*   **`lazy.lua`**: This file configures the `lazy.nvim` plugin manager. It sets the default behavior for lazy loading, the UI, and performance settings.

*   **`lspconfig.lua`**: This file configures the `neovim/nvim-lspconfig` plugin, which provides support for the Language Server Protocol (LSP). It's used to configure the LSP servers for different languages, enabling features like code completion, diagnostics, and go-to-definition.

*   **`treesitter.lua`**: This file configures the `nvim-treesitter/nvim-treesitter` plugin, which provides advanced syntax highlighting and code parsing. It's used to specify which language parsers to install and to enable features like highlighting and indentation.

*   **`ufo.lua`**: This file configures the `kevinhwang91/nvim-ufo` plugin, which provides a better code folding experience.

## Plugin Management (`plugins/`)

The `plugins` directory is responsible for managing the plugins themselves.

*   **`init.lua`**: This file is the entry point for the plugin manager. It contains a list of all the plugins to be installed and loaded. It uses the `lazy.nvim` plugin manager to handle the installation and loading of plugins.

## How to Test the Configuration

1.  Restart Neovim.
2.  Run `:Lazy sync` to ensure all plugins are correctly installed and loaded.
3.  Test the following features:
    *   Formatting on save (for file types configured in `configs/conform.lua`).
    *   LSP features (completion, diagnostics, etc.) for the configured languages.
    *   Treesitter highlighting and indentation.
    *   Code folding with `zR` and `zM`.
    *   Your custom key mappings.
    *   The LeetCode integration.
    *   The auto-header functionality for C++ files.
