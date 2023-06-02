{
  description = "Kompact project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pre-commit-hooks-nix.url = "github:hercules-ci/pre-commit-hooks.nix/flakeModule";
    pre-commit-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";
    aiken.url = "github:aiken-lang/aiken?ref=v1.0.7-alpha";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
      {
        imports = [
          inputs.pre-commit-hooks-nix.flakeModule
        ];
        systems = [ "x86_64-linux" "aarch64-darwin" ];
        perSystem = { config, self', inputs', pkgs, ... }: {
          pre-commit.settings.hooks = {
            nixpkgs-fmt.enable = true;
            markdownlint.enable = true;
            deno-fmt = {
              enable = true;
              name = "deno fmt";
              entry = "deno fmt";
              files = "";
              language = "system";
              pass_filenames = false;
            };
          };
          devShells.default = pkgs.mkShell {
            shellHook = ''
              ${config.pre-commit.installationScript}
              echo 1>&2 "Welcome to the development shell!"
            '';
            name = "hello-aiken";
            packages = with pkgs; [
              inputs'.aiken.packages.aiken
              deno
            ];
          };
        };
        flake = { };
      };
}
