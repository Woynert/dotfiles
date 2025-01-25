
# Neovim Config

## Dependencies

### Patched font

https://www.nerdfonts.com/font-downloads
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip

### Binaries

- tree-sitter. Advanced syntax highlighting
- xclip. Clipboard support

## How-to

### Update

```vim
:Lazy
```

### Format

```bash
stylua --glob '**/*.lua' .
```
