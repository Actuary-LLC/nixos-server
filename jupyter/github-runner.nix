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
  services.github-runners = {
      jupyter = {
        enable = true;
        #repo = "Actuary-LLC/jupyter";
        url = "https://github.com/Actuary-LLC/jupyter";
        tokenFile = "/etc/nixos/jupyter.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["jupyter"];
        name = "jupyter";
        user = "actuary";
        workDir = "/tmp/jupyter";
        extraPackages = with pkgs; [ docker ];
        nodeRuntimes = ["node16"];
      };
      postgres = {
        enable = true;
        #repo = "Actuary-LLC/postgres";
        url = "https://github.com/Actuary-LLC/postgres";
        tokenFile = "/etc/nixos/postgres.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["postgres"];
        name = "postgres";
        user = "postgres";
        workDir = "/tmp";
        extraPackages = with pkgs; [ docker ];
        nodeRuntimes = ["node16"];
    };
  };
}
