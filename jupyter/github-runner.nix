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
        url = "https://github.com/Actuary-LLC/postgres";
        tokenFile = "/etc/nixos/postgres.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["postgres"];
        name = "postgres";
        user = "postgres";
        workDir = "/tmp/postgres";
        extraPackages = with pkgs; [ docker ];
        nodeRuntimes = ["node16"];
    };
      lightdash = {
        enable = true;
        url = "https://github.com/Actuary-LLC/lightdash";
        tokenFile = "/etc/nixos/lightdash.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["lightdash"];
        name = "lightdash";
        user = "actuary";
        workDir = "/tmp/lightdash";
        extraPackages = with pkgs; [ docker ];
        nodeRuntimes = ["node16"];
    };
        website = {
        enable = true;
        url = "https://github.com/Actuary-LLC/website";
        tokenFile = "/etc/nixos/website.token";
        replace = true;
        serviceOverrides.ProtectHome = false;
        extraLabels = ["website"];
        name = "website";
        user = "actuary";
        workDir = "/tmp/website";
        extraPackages = with pkgs; [ docker ];
        nodeRuntimes = ["node16"];
    };
  };
}
