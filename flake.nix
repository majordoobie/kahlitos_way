# The python3Packages is define in the framework docs
# https://github.com/NixOS/nixpkgs/tree/master/doc/languages-frameworks
{
  description = "Nix flake for a Python3 project with requirements.txt and Docker support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        pythonEnv = pkgs.python3Packages.buildPythonPackage {
          pname = "my-python-project";
          version = "0.1.0";
          src = ./.;
          buildInputs = [
            pkgs.docker
            pkgs.git
          ];
          propagatedBuildInputs = with pkgs.python3Packages; [
            pip
            setuptools
            wheel
          ];
          # Install dependencies from requirements.txt
          preBuild = ''
            pip install -r requirements.txt
          '';
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pythonEnv
            pkgs.docker # Include Docker in the environment
          ];
          shellHook = ''
            echo "Welcome to the Python3 + Docker dev environment!"
          '';
        };
      }
    );
}
