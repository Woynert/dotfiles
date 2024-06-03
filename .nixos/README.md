### How-to

- (optional) Pin the stable channel `23.11.4030.9f2ee8c91ac4`

  ```sh
  sudo nix-channel --list
  sudo nix-channel --remove <your-channel>
  sudo nix-channel --add https://releases.nixos.org/nixos/23.11/nixos-23.11.4030.9f2ee8c91ac4/nixexprs.tar.xz nixos
  sudo nix-channel --update
  ```

- Link the config
  ```sh
  sudo ln -s ~/.nixos/config /etc/nixos/config
  ```

- Then put this as your `/etc/nixos/configuration.nix`:

  ```nix
  {
    imports =
      [
        ./hardware-configuration.nix
        ./config/configuration.nix
      ];
  }
  ```

- Apply and try `sudo nixos-rebuild test`

### Extra

- Setup mounts: Copy `.config/sample.mounts.nix` to `.config/mounts.nix`
  then modify accordingly.

- Change permissions:

  ```sh
  sudo chown root:root -R ~/.nixos/config
  ```

- Hard reset FHS:

  ```sh
  sudo bash -c ' \
    rm -rf /bin /lib /lib64 /sbin /usr && \
    mkdir -p /usr/bin /bin && \
    ln -s $(which env) /usr/bin/env && \
    ln -s $(which sh) /bin/sh \
  '

  sudo \rm -rf /bin /lib /lib64 /sbin /usr # (not recommended, use the one above)
  ```

- Setup HP printer, see [NixOS Manual on Printing](https://nixos.wiki/wiki/Printing):

  ```sh
  NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'
  ```
