
# Dependencies

## Patched font

https://www.nerdfonts.com/font-downloads
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip

## Funciton specific

- tree-sitter. Auto download language color format
    `nix-env -iv tree-sitter`

- xclip. Clipboard support
    `xbps-install xclip`

# Setup

## Install packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install plugins

```bash
vim ~/.config/nvim/lua/woynert/packer.lua
:so
:PackerSync
```
