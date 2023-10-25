{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  git
  github-runner
  ];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "nodejs-16.20.2"
    ];
  };

    services.github-runner.jupyter = {
      enable = true;
      url = "https://github.com/Actuary-LLC/jupyter";
      tokenFile = "/etc/nixos/jupyter.token";
      replace = true;
      serviceOverrides.ProtectHome = false;
      extraLabels = ["jupyter"];
      name = "jupyter";
      user = "actuary";
      workDir = "/tmp";
      extraPackages = with pkgs; [ docker ];
    };

    services.github-runner.database = {
      enable = true;
      url = "https://github.com/Actuary-LLC/database";
      tokenFile = "/etc/nixos/database.token";
      replace = true;
      serviceOverrides.ProtectHome = false;
      extraLabels = ["database"];
      name = "database";
      user = "actuary";
      workDir = "/tmp";
      extraPackages = with pkgs; [ docker ];
    };
  
  services.github-runner.nodeRuntimes = ["node16"];

}
