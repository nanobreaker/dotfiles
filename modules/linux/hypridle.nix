{ config, lib, pkgs, ... }: {

  home-manager.sharedModules = [{
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "hyprlock";
          before_sleep_cmd = "hyprlock";
        };

        listener = {
          timeout = 300;
          on-timeout = "hyprlock";
        };
      };
    };
  }];
}
