
### How-to

(Optional) Pin the stable channel (See https://releases.nixos.org/?prefix=nixos).

    sudo nix-channel --list
    sudo nix-channel --remove <your-channel>
    sudo nix-channel --add https://releases.nixos.org/nixos/26.05/nixos-26.05.1947.a0374025a863/nixexprs.tar.xz nixos
    sudo nix-channel --update

Link the config.

    sudo ln -s ~/.nixos/config /etc/nixos/config

Then put this as your `/etc/nixos/configuration.nix`:

    {
      imports =
        [
          ./hardware-configuration.nix
          ./config/configuration.nix
        ];
    }

Apply and try `sudo nixos-rebuild test`.

### Extra

Setup mounts: Copy `.config/sample.mounts.nix` to `.config/mounts.nix` then modify accordingly.

Change permissions.

    sudo chown root:root -R ~/.nixos/config

Hard reset FHS:

    sudo bash -c ' \
      rm -rf /bin /lib /lib64 /sbin /usr && \
      mkdir -p /usr/bin /bin && \
      ln -s $(which env) /usr/bin/env && \
      ln -s $(which sh) /bin/sh \
    '
    sudo \rm -rf /bin /lib /lib64 /sbin /usr # (not recommended, use the one above)

Setup HP printer, see [NixOS Manual on Printing](https://nixos.wiki/wiki/Printing):

    NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'

To run wild binaries without elf-patching you might wanna create `/lib64/ld-linux-x86-64.so.2`, until this is implemented at the `fhs` module level.


### History of revisions

2025 https://releases.nixos.org/nixos/25.11/nixos-25.11.5581.23d72dabcb3b/nixexprs.tar.xz
2026 https://releases.nixos.org/nixos/26.05/nixos-26.05.1947.a0374025a863/nixexprs.tar.xz

