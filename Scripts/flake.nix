{
  description = "hyprdot dependancy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          default = pkgs.symlinkJoin {
            name = "my-packages";
            paths = with pkgs; [
            pavucontrol
            pamixer
            networkmanagerapplet
            blueman
            brightnessctl
            udiskie
            libsForQt5.qt5.qtquickcontrols
            libsForQt5.qt5.qtquickcontrols2
            libsForQt5.qt5.qtgraphicaleffects
            hyprland
            dunst
            rofi-wayland
            waybar
            swww
            swaylock-effects
            wlogout
            grimblast
            hyprpicker
            slurp
            swappy
            cliphist


            xdg-desktop-portal-hyprland
            parallel
            jq
            imagemagick
            libsForQt5.qt5.qtimageformats
            libsForQt5.ffmpegthumbs
            libsForQt5.kde-cli-tools
            libnotify

            nwg-look
            libsForQt5.qt5ct
            kdePackages.qt6ct
            libsForQt5.qtstyleplugin-kvantum
            libsForQt5.qt5.qtwayland
            qt6.qtwayland

            firefox
            kitty
            dolphin
            ark
            vim
            neovim

            eza
            starship
            fastfetch
            flatpak
            which


            ];
          };
        };
      });
}
