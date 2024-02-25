{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jtraversier";
  home.homeDirectory = "/home/jtraversier";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.neofetch
    pkgs.fd
    pkgs.bat
    pkgs.neovim
    pkgs.eza
    pkgs.fzf
    pkgs.kitty
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.fish
    pkgs.fishPlugins.fzf-fish
    pkgs.grc
    pkgs.starship
    pkgs.fishPlugins.grc
    pkgs.waybar
    pkgs.swww
    pkgs.dunst
    pkgs.lm_sensors

#    pkgs.coreutils
#    pkgs.fuzzel
#    pkgs.rsync
#    pkgs.meson
#    pkgs.typescript
#    pkgs.gjs
#    pkgs.sassc
#
#    pkgs.python311Packages.build
#    pkgs.python311Packages.material-color-utilities
#    pkgs.python311Packages.pillow
#    pkgs.python311Packages.poetry-core
#    pkgs.python311Packages.pywal
#    pkgs.python311Packages.setuptools-scm
#    pkgs.python311Packages.wheel
#
    pkgs.pipewire
    pkgs.wireplumber
    pkgs.networkmanager
    pkgs.networkmanagerapplet

    pkgs.qt6.qtwayland
    pkgs.libsForQt5.qt5.qtquickcontrols
    pkgs.libsForQt5.qt5.qtquickcontrols2
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.libsForQt5.qt5.qtgraphicaleffects

    pkgs.dconf

    pkgs.rofi-wayland
    pkgs.swaylock-effects
    pkgs.wlogout
    pkgs.grimblast
    pkgs.slurp
    pkgs.swappy
    pkgs.cliphist
    pkgs.wl-clipboard

    pkgs.polkit-kde-agent
#   pkgs.xdg-desktop-portal
#   pkgs.xdg-desktop-portal-hyprland
    pkgs.parallel
    pkgs.imagemagick
    pkgs.jq
    pkgs.libsForQt5.qt5.qtimageformats
    pkgs.ffmpegthumbs
    pkgs.kde-cli-tools
    pkgs.brightnessctl
    pkgs.pavucontrol
    pkgs.pamixer
    pkgs.flatpak

    pkgs.nwg-look
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.qt5ct
#    pkgs.libdbusmenu-gtk3
#    pkgs.plasma-browser-integration
    pkgs.playerctl
    pkgs.pokemon-colorscripts-mac
    pkgs.wallust
#
#    pkgs.webp-pixbuf-loader
#    pkgs.gtk-layer-shell
#    pkgs.gtk3
#    pkgs.gtksourceview
#    pkgs.gobject-introspection
#    pkgs.upower
#    pkgs.yad
#    pkgs.ydotool
#
#    pkgs.polkit_gnome
#    pkgs.gnome.gnome-control-center
#    pkgs.gnome.gnome-keyring
#    pkgs.blueberry
#    pkgs.wlsunset
#    pkgs.gnome.gnome-bluetooth
#
#    pkgs.swayidle
#    pkgs.wl-clipboard
#    pkgs.hyprpicker
#    pkgs.grim
#    pkgs.tesseract
#
#    pkgs.adw-gtk3
#    pkgs.gradience
#    pkgs.fontconfig
#    pkgs.lexend
#



    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jtraversier/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.hyprland ];
  };



#  programs.fish = {
#    enable = true;
#    interactiveShellInit = "starship init fish | source";
#    shellAliases = {
#      l = "exa --icons";
#      ls = "exa -l";
#      t = "exa --tree"; 
#      cat = "bat";
#    };              
#  };
#  programs.kitty = {
#    enable = true;
#    font.name = "FiraCode";
#    font.size = 11;
#    shellIntegration.enableFishIntegration = true;
#  };
#  programs.starship = {
#    enable = true;
#    enableFishIntegration = true;
#  };

  # Let Home Manager install and manage itself.
#  programs.ripgrep.enable = true;
#  programs.fzf.enable = true;
#  programs.eza.enable = true;
#  programs.lazygit.enable = true;
  programs.home-manager.enable = true;
}
