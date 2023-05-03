# LVIM FM - Neovim file manager (fzf)

![lvim-logo](https://user-images.githubusercontent.com/82431193/115121988-3bc06800-9fbe-11eb-8dab-19f624aa7b93.png)

[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://github.com/lvim-tech/lvim-colorscheme/blob/main/LICENSE)

## Requirements

-   Neovim
-   lvim-tech/lvim-shell
-   fzf
-   exa
-   fd
-   rg
-   awk, rev, cut, sed, tr, tail

## Installation

Install the plugin with your preferred package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  {
    "lvim-tech/lvim-fm",
    dependencies = { "lvim-tech/lvim-shell" },
    config = function()
      require("lvim-fm").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
})
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "lvim-tech/lvim-fm",
  requires = { "lvim-tech/lvim-shell" },
  config = function()
    require("lvim-fm").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
})
```

## Default configuration

```lua
{
  ui = {
    default = "float",
    float = {
      border = { " ", " ", " ", " ", " ", " ", " ", " " },
      float_hl = "Normal",
      border_hl = "FloatBorder",
      blend = 0,
      height = 1,
      width = 1,
      x = 0.5,
      y = 0.5,
    },
    split = "rightbelow new", -- `leftabove new`, `rightbelow new`, `leftabove vnew 24`, `rightbelow vnew 24`
  },
  on_close = {},
  on_open = {},
  mappings = {
    vert_split = "<C-v>",
    horz_split = "<C-h>",
    tabedit = "<C-t>",
    edit = "<C-e>",
    close = "<C-q>",
  },
}
```

## Command

```lua
:LvimFileManager
```

## Keys

| Key       | Action                                                            |
| --------- | ----------------------------------------------------------------- |
| `<C-m>`   | Menu                                                              |
| `<C-e>`   | Explorer                                                          |
| `<C-f>`   | Search files                                                      |
| `<C-s>`   | Search in files                                                   |
| `<C-q>`   | Close                                                             |
| `<Esc>`   | Clear search                                                      |
| `<C-d>`   | Scroll down preview                                               |
| `<C-d>`   | Scroll up preview                                                 |
| `<M-p>`   | Toggle preview (show / hide)                                      |
| `<M-l>`   | Toggle info (short / long) - for Explorer and Search Files        |
| `<M-h>`   | Toggle hidden files (show / hide) - for Explorer and Search Files |
| `<Enter>` | Open file(s) in current buf                                       |
| `<C-v>`   | Open file(s) with split (vertical)                                |
| `<C-h>`   | Open file(s) with split (horizontal)                              |
| `<C-t>`   | Open file(s) in new tab                                           |
