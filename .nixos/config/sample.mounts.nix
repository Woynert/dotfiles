{ ... }:

{
  #fileSystems."/plan" =
  #{
    #device = "/dev/disk/by-uuid/6574a390-32c4-4711-860d-bc71661c598d";
    #fsType = "ext4";
  #};

  #fileSystems."/data" =
  #{
    #device = "/dev/disk/by-uuid/6574a390-32c4-4711-860d-bc71661c598d";
    #fsType = "ntfs-3g";
    #options = [ "rw" "uid=1000" ];
  #};

  # extract from /boot/grub/grub.cfg
  #boot.loader.grub.extraEntries = ''
    #menuentry 'Ubuntu 20.04.6 LTS (20.04) (on /dev/nvme0n1p3)' ...
        #savedefault
        #insmod part_gpt
        #insmod ext2
        #search --no-floppy --fs-uuid --set=root 15b79b1a-3e9a-4b54-a25b-17f1df22acfc
        #linux /boot/vmlinuz-5.15.0-67-generic root=UUID=15b79b1a-3e9a-4b54-a25b-17f1df22acfc ro quiet splash $vt_handoff
        #initrd /boot/initrd.img-5.15.0-67-generic
    #}
  #'';
}
