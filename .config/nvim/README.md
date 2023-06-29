# Bases

| Key | Action |
|--|--|
| `<leader>` | , |
| `<S>` | shift |
| `<A>` | alt |
| `<C>` | ctrl |
| `<CR>` | cariage return |

# Keymap
## No remap
| Key | Action | Description |
|--|--|--|
| `<up>` | no op ||
| `<down>` | no op ||
| `<left>` | no op ||
| `<right>` | no op ||
| `<leader>w` | `:w<CR>` | Save the current file |
| `<leader>q` | `:q<CR>` | Close the current file |

## Tab navigation
| Key | Action | Description |
|--|--|--|
| `<S-H>` | `:tabprev<CR>` | Go to previous tab |
| `<S-L>` | `:tabnext<CR>` | Go to next tab |
| `<leader>TT` | `:tabnew<CR>` | Create new tab |
| `<leader>TC` | `:tabclose<CR>` | Close current tab |

## LazyGit
| Key | Action | Description |
|--|--|--|
| `<leader>gg` | `:LazyGit<CR>` | Open LazyGit neovim integration |

## Telescope
| Key | Action | Description |
|--|--|--|
| `<leader>fd` | `:Telescope file_browser<CR>` | Open file browser |
| `<leader>fb` | `:Telescope file_browser path=%:p:h<CR>` | Open file browser in current dir |
| `<leader>ff` | `:Telescope find_files<CR>` | Find a file |
| `<leader>fg` | `:Telescope live-grep<CR>` | Find text with regex inside folder's files |
| `<leader>pp` | `:Telescope project <CR>` | Select a project |
| `<leader>nc` | `:Telescope neoclip<CR>` | Open clipboard |

## Misc
| Key | Action |
| `dd` | Delete line |
| `O` | Insert line before |
| `yyp` | Duplicate line after |
| `yyP` | Duplicate line before |
| `i` | Insert before the cursor |
| `I` | Insert before the line |
| `a` | Insert after the cursor |
| `A` | Insert after the line |

