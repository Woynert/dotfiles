{ ... }:

{

  users.users.streamer = {
    isNormalUser = true;
    description = "streamer";
    extraGroups = [
      "networkmanager" "video" "audio" "libvirtd" "docker" "storage" "scanner" "lp"
      "plan_dev_streamer"
    ];
    home = "/streamer/home";
  };

  # sudo chown -R :plan_dev_streamer /my/path
  # sudo chmod -R 775 /my/path
  #systemd.tmpfiles.rules = [
    #"d /streamer 0770 root plan_dev_streamer - -"
  #];

  users.groups = {
    plan_dev_streamer = {};
  };
}
