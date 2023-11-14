{
  self,
  flake-utils,
  nixpkgs-nixos,
  ...
}:
with flake-utils.lib.system;
  nixpkgs-nixos.lib.nixosSystem {
    system = aarch64-linux;
    modules = [
      self.nixosModules.default
      self.nixosModules.install-iso
      ({pkgs, ...}: {
        environment.systemPackages = [
          pkgs.partition-phosphorus
        ];
      })
    ];
  }
