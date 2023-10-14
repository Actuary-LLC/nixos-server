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
  services.github-runner.enable = true;
  services.github-runner.url = "https://github.com/Actuary-LLC/jupyter"; #Token needs to have read/write Administration priviledges to create runners.
  services.github-runner.tokenFile = "/etc/nixos/runner.token";
  services.github-runner.replace = true;
  services.github-runner.serviceOverrides = {
    ProtectHome = false;
  };
  services.github-runner.name = "deploy";
  services.github-runner.user = "alex";
  #services.github-runner.workDir = "/tmp/Github";
  services.github-runner.extraPackages = with pkgs; [
    docker
    # nixos-rebuild
  ];
  
  services.github-runner.nodeRuntimes = ["node16"];

}