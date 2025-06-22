{ pkgs, ... }: {

  home-manager.sharedModules = [{
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;

        command_timeout = 1300;
        scan_timeout = 30;

        format = "$directory$character";

        character = {
          success_symbol = "|>";
          error_symbol = "|>";
        };

        directory = {
          format = "[$path]($style) ";
          truncation_length = 1;
          fish_style_pwd_dir_length = 1;
        };
      };
    };
  }];
}
