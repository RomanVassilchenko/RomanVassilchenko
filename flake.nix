{
  description = "romanv.dev portfolio, GitHub profile, and resume toolchain";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nodejs_22
              gnumake
              direnv
              nixfmt
              playwright-driver.browsers
            ];

            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
            PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";

            shellHook = ''
              echo "romanv.dev · Node $(node --version) · npm $(npm --version)"
              echo "Run 'make help' to see the available commands."
            '';
          };
        }
      );

      formatter = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.writeShellApplication {
          name = "romanv-format-nix";
          runtimeInputs = [ pkgs.nixfmt ];
          text = ''
            if [ "$#" -eq 0 ]; then
              exec nixfmt flake.nix
            fi
            exec nixfmt "$@"
          '';
        }
      );

      apps = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          command = name: target: {
            type = "app";
            meta.description = "Run the romanv.dev '${target}' workflow";
            program = "${
              pkgs.writeShellApplication {
                inherit name;
                runtimeInputs = [
                  pkgs.nodejs_22
                  pkgs.gnumake
                ];
                text = ''
                  export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
                  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
                  make ${target} "$@"
                '';
              }
            }/bin/${name}";
          };
        in
        {
          default = command "romanv-dev" "dev";
          dev = command "romanv-dev" "dev";
          build = command "romanv-build" "build";
          preview = command "romanv-preview" "preview";
          lint = command "romanv-lint" "lint";
          format = command "romanv-format" "format";
          resume = command "romanv-resume" "generate";
          install = command "romanv-install" "install";
        }
      );
    };
}
