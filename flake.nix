{
  description = "Network infrastructure à la Roman. Do not try this at home.";

  nixConfig.extra-substituters = [
    "https://rvolosatovs.cachix.org"
    "https://wasmcloud.cachix.org"
  ];
  nixConfig.extra-trusted-public-keys = [
    "rvolosatovs.cachix.org-1:eRYUO4OXTSmpDFWu4wX3/X08MsP01baqGKi9GsoAmQ8="
    "wasmcloud.cachix.org-1:9gRBzsKh+x2HbVVspreFg/6iFRiD4aOcUQfXVDl3hiM="
  ];

  inputs.base16-shell.flake = false;
  inputs.base16-shell.url = github:chriskempson/base16-shell;
  inputs.fenix.url = github:nix-community/fenix;
  inputs.firefox-addons.inputs.flake-utils.follows = "flake-utils";
  inputs.firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
  inputs.firefox-addons.url = gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons;
  inputs.flake-utils.url = github:numtide/flake-utils;
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.home-manager.url = github:nix-community/home-manager/release-23.05;
  inputs.ioquake3-mac-install.flake = false;
  inputs.ioquake3-mac-install.url = github:rvolosatovs/ioquake3-mac-install;
  inputs.lanzaboote.url = github:nix-community/lanzaboote;
  inputs.nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nix-darwin.url = github:LnL7/nix-darwin;
  inputs.nix-flake-tests.url = github:antifuchs/nix-flake-tests;
  inputs.nixify.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixify.url = github:rvolosatovs/nixify;
  inputs.nixlib.url = github:nix-community/nixpkgs.lib;
  inputs.nixos-generators.inputs.nixlib.follows = "nixlib";
  inputs.nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixos-generators.url = github:nix-community/nixos-generators;
  inputs.nixos-hardware.url = github:NixOS/nixos-hardware;
  inputs.nixpkgs-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
  inputs.sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.sops-nix.url = github:Mic92/sops-nix;

  outputs = inputs @ {
    self,
    nixpkgs,
    nixify,
    ...
  }:
    with nixify.lib; let
      flake = mkFlake {
        withOverlays = {overlays, ...}: overlays // import ./overlays inputs;
        overlays = [
          self.overlays.default
        ];

        withDevShells = {
          devShells,
          pkgs,
          ...
        }:
          extendDerivations {
            buildInputs = [
              pkgs.age
              pkgs.openssh
              pkgs.openssl
              pkgs.sops
              pkgs.ssh-to-age
              pkgs.yubikey-manager
              pkgs.yubikey-personalization

              pkgs.bootstrap
              pkgs.bootstrap-ca
              pkgs.host-key
              pkgs.ssh-for-each
            ];
          }
          devShells;

        withChecks = {
          checks,
          pkgs,
          ...
        }:
          checks
          // import ./checks inputs pkgs;

        withPackages = {
          pkgs,
          packages,
          ...
        }:
          packages
          // {
            inherit
              (pkgs)
              host-key
              install-iso
              neovim
              partition-osmium
              ssh-for-each
              ;
          };
      };
    in
      flake
      // {
        darwinConfigurations = import ./darwinConfigurations inputs;
        darwinModules = import ./darwinModules inputs;
        homeConfigurations = import ./homeConfigurations inputs;
        homeModules = import ./homeModules inputs;
        lib = import ./lib inputs;
        nixosConfigurations = import ./nixosConfigurations inputs;
        nixosModules = import ./nixosModules inputs;
      };
}
