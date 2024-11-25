{
  description = "An image resizing server written in Go";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { nixpkgs, ... }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      defaultPackage.x86_64-linux = pkgs.buildGoModule {
        pname = "picfit";
        version = "0.15.0";
        src = ./.;
        vendorHash = "sha256-d7hEPVy1HvwwFKQKYbmYZlz1wfJiciojC6BCr+LwpaE=";
        doCheck = false; # Tests segfault when run by nix!
      };
    };
}
