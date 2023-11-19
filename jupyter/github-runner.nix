{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  github-runner
  nodejs_16
  nodejs_20
  ];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "nodejs-16.20.2"
    ];
  };
  services.github-runners = {
      actuary = {
        enable = true;
        url = "https://github.com/Actuary-LLC";
        tokenFile = "/etc/nixos/actuary.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["actuary"];
        name = "actuary";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          nodejs_16 
          nodejs_20 ];
        nodeRuntimes = ["node16"
        "node20"
        ];
      };
  };
}
