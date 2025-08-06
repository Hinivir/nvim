{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    gift-wrap = {
      url = "github:tgirlcloud/gift-wrap";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      gift-wrap,
    }:
    let
      inherit (nixpkgs) lib;

      forAllSystems =
        f:
        lib.genAttrs lib.systems.flakeExposed (
          system:
          f (
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
              overlays = [ ];
            }
          )
        );
    in
    {
      formatter = forAllSystems (
        pkgs:
        pkgs.treefmt.withConfig {
          runtimeInputs = with pkgs; [
            deadnix
            nixfmt-rfc-style
            statix
            stylua
            taplo

            (writeShellScriptBin "statix-fix" ''
              for file in "$@"; do
                ${lib.getExe statix} fix "$file"
              done
            '')
          ];

          settings = {
            on-unmatched = "info";
            tree-root-file = "flake.nix";

            formatter = {
              deadnix = {
                command = "deadnix";
                includes = [ "*.nix" ];
              };

              nixfmt = {
                command = "nixfmt";
                includes = [ "*.nix" ];
              };

              statix = {
                command = "statix-fix";
                includes = [ "*.nix" ];
              };

              stylua = {
                command = "stylua";
                includes = [ "*.lua" ];
              };

              taplo = {
                command = "taplo";
                options = "format";
                includes = [ "*.toml" ];
              };
            };
          };
        }
      );

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = [
            self.formatter.${pkgs.stdenv.hostPlatform.system}
            pkgs.selene
            pkgs.stylua
            pkgs.lua-language-server
            pkgs.taplo
            pkgs.nvfetcher
          ];
        };
      });

      packages = forAllSystems (pkgs: {
        nvim = gift-wrap.legacyPackages.${pkgs.system}.wrapNeovim {
          pname = "hinivim";

          basePackage = pkgs.neovim-unwrapped;

          aliases = [
            "vi"
            "vim"
            "nv"
          ];

          keepDesktopFiles = true;

          # your user conifguration, this should be a path your nvim config in lua
          userConfig = ./config;

          # all the plugins that should be stored in the neovim start directory
          # these are the plugins that are loaded when neovim starts
          startPlugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
            nvim-lspconfig
            lualine-nvim
            fidget-nvim
            mini-nvim
            nvim-colorizer-lua
            mini-icons
            todo-comments-nvim
            indent-blankline-nvim
            neo-tree-nvim
            mini-surround
            undotree
            direnv-vim
            cord-nvim
            gitsigns-nvim
            nui-nvim
            catppuccin-nvim
            lz-n
          ];

          # these are plugins that are loaded on demand by your configuration
          optPlugins = with pkgs.vimPlugins; [
            blink-cmp
            telescope-nvim
            lazygit-nvim
          ];

          # these are any extra packages that should be available in your neovim environment
          extraPackages = with pkgs; [
            ripgrep
            fd
            inotify-tools
            lazygit
          ];
        };
      });
      defaultPackage = forAllSystems (pkgs: self.packages.${pkgs.system}.nvim);
    };
}
