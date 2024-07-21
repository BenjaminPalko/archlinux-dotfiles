{ config, pkgs, ... }:
{
  imports = [ ./gtk.nix ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "catpuccin-mocha-light-cursors";
    size = 24;
  };

  home.packages = with pkgs; [
    rofi-wayland
    swaynotificationcenter
  ];

  programs.pywal.enable = true;
  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    hypr = {
      source = config.lib.file.mkOutOfStoreSymlink ../../hypr;
      recursive = true;
    };
    rofi = {
      source = config.lib.file.mkOutOfStoreSymlink ../../rofi;
      recursive = true;
    };
    swaync = {
      source = config.lib.file.mkOutOfStoreSymlink ../../swaync;
      recursive = true;
    };
    wal = {
      source = config.lib.file.mkOutOfStoreSymlink ../../wal;
      recursive = true;
    };
    waybar = {
      source = config.lib.file.mkOutOfStoreSymlink ../../waybar;
      recursive = true;
    };
  };
}
