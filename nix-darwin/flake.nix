{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config,... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs;
        [ 
          # nix utils
          mkalias
          # cli
            # editor
            neovim
            helix
            # shell
            zsh
            zsh-powerlevel10k
            zsh-autosuggestions
            fish
            nushell
            # lang
            rustup
            go
            bun
            opam
            coursier
            jdk
            # tool
            mas
            git
            yabai
            skhd
            neo-cowsay
            clash-rs
            clolcat
            fzf
            fortune-kind
            yazi
            # media
            spotify
            mpv

          #gui
            # terminal
            # kitty
            # alacritty
            #editor
            neovide
        ];

      homebrew = {
        enable = true;
        brews = [
          "ghcup"
          "starship"
        ];
        casks = [
          "google-chrome"
          "firefox"
          "kitty"
          "miniconda"
          "alfred"
          "bartender"
          "downie"
          "WhatsApp"
          "telegram"
          "zed@preview"
          "visual-studio-code"
          "clion"
          "intellij-idea"
          "pycharm"
          "goland"
          "rust-rover"
          "spotify"
          "discord"
          "input-source-pro"
          "notion"
          "typora"
          "obsidian"
          "zotero"
        ];
        masApps = {
          "WeChat" = 836500024;
          "QQ" = 451108668;
          "MS Word" = 462054704;
          "MS Excel" = 462058435;
          "MS PowerPoint" = 462062816;
          "OneDrive" = 823766827;
          "XCode" = 497799835;
          "QQMusic" = 595615424;
          "NeteaseMusic" = 944848654;
          "Lark" = 6449830127;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };
      
      fonts.packages = with pkgs; [ 
        nerd-fonts.fira-code
        nerd-fonts.fira-mono
      ]; 

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';
      
      system.defaults = {
        dock.autohide = true;
      };

      services.yabai.enable = true;
      services.skhd.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";

      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mbpro" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;
            # User owning the Homebrew prefix
            user = "sushuai";
            autoMigrate = true;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbpro".pkgs;
  };
}
