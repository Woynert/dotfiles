{ ... }:

{
  fileSystems."/plan" =
    {
      device = "/dev/disk/by-uuid/6574a390-32c4-4711-860d-bc71661c598d";
      fsType = "ext4";
    };

  #fileSystems."/data" =
  #{ device = "/dev/disk/by-uuid/6574a390-32c4-4711-860d-bc71661c598d";
  #fsType = "ntfs-3g";
  #options = [ "rw" "uid=1000" ];
  #};
}
