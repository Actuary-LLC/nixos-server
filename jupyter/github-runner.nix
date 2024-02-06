{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  github-runner
  ];
  nixpkgs.config = {
    allowUnfree = true;
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
          ];
      };
      alex = {
        url = "https://github.com/AlexanderTroyScott/hackathon-predictive-analytics";
        tokenFile = "/etc/nixos/alex.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["actuary"];
        name = "actuary";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      };
      memos = {
        url = "https://github.com/AlexanderTroyScott/memos";
        tokenFile = "/etc/nixos/memos.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["documentation"];
        name = "actuary";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      };
      personal = {
        enable = true;
        url = "https://github.com/AlexanderTroyScott/factorio";
        tokenFile = "/etc/nixos/personal.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["HardwareName"];
        name = "HardwareName";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      };
      palworld = {
        enable = true;
        url = "https://github.com/AlexanderTroyScott/steamcmd";
        tokenFile = "/etc/nixos/personal.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["HardwareName"];
        name = "HardwareName";
        user = "actuary";
        #workDir = "/tmp";
        extraPackages = with pkgs; [ 
          docker
          ];
      };
  };
}
