  { config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker
  ];
  virtualisation.docker.enable = true;
  #virtualisation.docker.rootless = {
   # enable = true;
   # setSocketVariable = true;
  #};
  virtualisation.docker.liveRestore = false;
  virtualisation.docker.storageDriver = "btrfs";

  # (Optional) Enable Docker registry.
  services.dockerRegistry.enable = true;
  # services.dockerRegistry.proxy.enable = true;

}
