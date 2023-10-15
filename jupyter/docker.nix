  { config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
  ];
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  virtualisation.docker.liveRestore = false;
  virtualisation.docker.storageDriver = "btrfs";

}
