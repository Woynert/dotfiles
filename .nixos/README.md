### How-to

- Link the config:

  ```sh
  sudo ln -s ~/.nixos/config /etc/nixos/config
  ```

- Then put this as your `configuration.nix`:

  ```nix
  {
    imports =
      [
        ./hardware-configuration.nix
        ./config/configuration.nix
      ];
  }
  ```

### Extra

- Setup mounts: Copy `.config/sample.mounts.nix` to `.config/mounts.nix`
  then modify accordingly.

- Change permissions:

  ```sh
  sudo chown root:root -R ~/.nixos/config
  ```

- Hard reset FHS:

  ```sh
  sudo \rm -rf /bin /lib /lib64 /sbin /usr

  sudo bash -c ' \
    rm -rf /bin /lib /lib64 /sbin /usr && \
    mkdir -p /usr/bin /bin && \
    ln -s $(which env) /usr/bin/env && \
    ln -s $(which sh) /bin/sh \
  '
  ```

- Setup HP printer. See [NixOS Manual on Printing](https://nixos.wiki/wiki/Printing):

  ```sh
  NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'
  ```
