{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    # nix-homebrew.url = "git+https://github.com/zhaofengli/nix-homebrew?ref=refs/pull/71/merge";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew,...}:
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
            starship
            neovim
            helix
            eza
            # shell
            tealdeer
            zsh
            # zsh-powerlevel10k
            zsh-autosuggestions
            # zsh-autocomplete
            zsh-syntax-highlighting
            # zsh-fast-syntax-highlighting
            zsh-completions
            fish
            nushell
            zoxide
            bat
            zellij
            tree
            # lang
            bash-language-server
            go
            gopls
            bun
            deno
            marksman
            nil
            lua-language-server
            opam
            coursier
            jdk
            taplo
            typst
            tinymist
            typstyle
            foundry
            ruff
            solc
            yaml-language-server
            uv
            # tool
            git
            yabai
            skhd
            neo-cowsay
            clolcat
            fortune-kind
            yazi
            # media
            viu
            chafa
            imgcat
            viu
          #gui
            # terminal
            #editor
            neovide
        ];

      homebrew = {
        enable = true;
        taps = [
          # "jmattaa/laser"
        ];
        brews = [
          # "jmattaa/laser/laser"
          "mas"
          "fzf"
          "ghcup"
          "unar"
          # "ollama"
          # "micromamba"
          "rustup"
        ];
        casks = [
          "mpv"
          "google-chrome"
          "firefox"
          "kitty"
          "wezterm"
          "miniforge"
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
          "rustrover"
          "spotify"
          "discord"
          "input-source-pro"
          "notion"
          "typora"
          "obsidian"
          "zotero"
          "logseq"
          "1password"
          "1password-cli"
          # "mpv"
          "spotify"
          "anytype"
          "hhkb"
          "clash-verge-rev"
          "keycastr"
          "font-google-sans-code"
          "jordanbaird-ice"
        ];
        masApps = {
          "WeChat" = 836500024;
          "QQ" = 451108668;
          "MS Word" = 462054704;
          "MS Excel" = 462058435;
          "MS PowerPoint" = 462062816;
          "OneDrive" = 823766827;
          "Pages" = 361309726;
          "Numbers" = 361304891;
          "Keynote" = 361285480;
          "XCode" = 497799835;
          "QQMusic" = 595615424;
          "NetCloud Music" = 944848654;
          "Final Cut Pro" = 424389933;
          "Compressor" = 424390742;
          "Photomator" = 1444636541;
          "Affinity Photo 2" = 1616822987;
          "Bonjourr Startpage" = 1615431236;
          "UPDF" = 1619925971;
        };
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
      };
      
      fonts.packages = with pkgs; [ 
        nerd-fonts.fira-code
        nerd-fonts.fira-mono
        julia-mono
      ]; 

      # system.activationScripts.applications.text = let
      #   env = pkgs.buildEnv {
      #     name = "system-applications";
      #     paths = config.environment.systemPackages;
      #     pathsToLink = "/Applications";
      #   };
      # in
      #   pkgs.lib.mkForce ''
      #     # Set up applications.
      #     echo "setting up /Applications..." >&2
      #     rm -rf /Applications/Nix\ Apps
      #     mkdir -p /Applications/Nix\ Apps
      #     find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      #     while read -r src; do
      #       app_name=$(basename "$src")
      #       echo "copying $src" >&2
      #       ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      #     done
      #   '';
      system = {
        primaryUser = "sushuai";
        defaults = {
          dock = {
            autohide = true;
            magnification = true;
            minimize-to-application = true;
            show-recents = false;
          };
          trackpad = {
            Clicking = true;
            TrackpadThreeFingerDrag = true;
            TrackpadThreeFingerTapGesture = 2;
          };
          finder = {
            _FXSortFoldersFirst = true;
            _FXSortFoldersFirstOnDesktop = true;
        };
          NSGlobalDomain = {
            AppleICUForce24HourTime = true;
          };
        };
      };

      services = {
        yabai.enable = true;
        skhd.enable = true;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.man.enable = true;
      
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableFzfCompletion = true;
        promptInit = ''
          source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
          export JAVA_HOME=${pkgs.jdk}
          '';
          enableSyntaxHighlighting = true;
          # enableFastSyntaxHighlighting = true;
      };
      programs.fish = {
        enable = true;
        promptInit = ''
          set -gx JAVA_HOME ${pkgs.jdk}
          '';
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";

      security.pam.services.sudo_local = {
        touchIdAuth = true;
        watchIdAuth = true;
      };

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
