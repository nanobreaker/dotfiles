{ config, lib, ... }: {
  home-manager.sharedModules = [{ programs.btop = { enable = true; }; }];
}
