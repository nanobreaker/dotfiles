{ config, lib, pkgs, ... }: {
  hardware.graphics = { enable = true; };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.hyprland ];
  };

  environment.systemPackages = with pkgs; [
    kitty
    hyprcursor
    hyprpicker
    hyprpaper
    grimblast
    wf-recorder
    wl-clipboard
  ];

  environment.variables = {
    XDG_SCREENSHOTS_DIR = "~/Screenshots";
    XDG_PICTURES_DIR = "~/Pictures";
  };

  programs.hyprland.enable = true;

  home-manager.sharedModules = [{

    wayland.windowManager.hyprland = let
      rgb = color: "rgb(${color})";
      rgba = color: alpha: "rgba(${color}${alpha})";
    in {
      enable = true;

      systemd = {
        enable = true;
        enableXdgAutostart = true;
        variables = [ "--all" ];
      };

      xwayland = { enable = true; };

      settings = {
        monitor =
          [ "eDP-1, 1920x1080@60, 0x0, 1" "DP-3, 2560x1440@144, 1920x0, 1" ];

        workspace = [
          "1, monitor: DP-3"
          "2, monitor: DP-3"
          "3, monitor: DP-3"
          "4, monitor: DP-3"
          "5, monitor: eDP-1"
          "6, monitor: eDP-1"
          "7, monitor: eDP-1"
          "8, monitor: eDP-1"
        ];

        general = {
          gaps_in = 0;
          gaps_out = 0;

          "col.inactive_border" =
            lib.mkForce "rgb(${config.lib.stylix.colors.base00})";

          "col.active_border" = lib.mkForce "rgb(414042)";

          border_size = 1;
          resize_on_border = true;
        };

        decoration = {
          rounding = 0;
          rounding_power = 4;

          dim_inactive = false;
          dim_strength = 0.2;

          active_opacity = 1.0;
          inactive_opacity = 1.0;
        };

        dwindle = { preserve_split = true; };

        misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "us,ru";
          kb_options = "grp:alt_shift_toggle";
          follow_mouse = 1;
          sensitivity = 0;
        };

        bind = [
          "SUPER, F, fullscreen"
          "SUPER, M, exit,"
          "SUPER, E, exec, pcmanfm"
          "SUPER, V, togglefloating,"
          "SUPER, D, exec, pkill fuzzel; fuzzel"
          "SUPER, P, exec, hyprpicker"

          "SUPER, return, exec, ghostty"

          "SUPER SHIFT, Q, killactive,"
          "SUPER SHIFT, C, exec, pkill waybar; hyprctl dispatch exec waybar"

          "SUPER, S, exec, grimblast copy area -"
          "SUPER SHIFT, S, exec, grimblast copy output"

          "SUPER SHIFT, L, exec, hyprlock"

          "SUPER, left, movefocus, l"
          "SUPER, right, movefocus, r"
          "SUPER, up, movefocus, u"
          "SUPER, down, movefocus, d"

          "SUPER SHIFT, left, movewindow, l"
          "SUPER SHIFT, right, movewindow, r"
          "SUPER SHIFT, up, movewindow, u"
          "SUPER SHIFT, down, movewindow, d"

          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
          "SUPER, 4, workspace, 4"
          "SUPER, 5, workspace, 5"
          "SUPER, 6, workspace, 6"
          "SUPER, 7, workspace, 7"
          "SUPER, 8, workspace, 8"
          "SUPER, 9, workspace, 9"

          "SUPER SHIFT, 1, movetoworkspace, 1"
          "SUPER SHIFT, 2, movetoworkspace, 2"
          "SUPER SHIFT, 3, movetoworkspace, 3"
          "SUPER SHIFT, 4, movetoworkspace, 4"
          "SUPER SHIFT, 5, movetoworkspace, 5"
          "SUPER SHIFT, 6, movetoworkspace, 6"
          "SUPER SHIFT, 7, movetoworkspace, 7"
          "SUPER SHIFT, 8, movetoworkspace, 8"
          "SUPER SHIFT, 9, movetoworkspace, 9"
        ];
      };
    };
  }];
}
