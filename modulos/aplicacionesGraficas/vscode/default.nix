{
  config,
  lib,
  usuario,
  pkgs,
  ...
}:
{
  options.anfistema.aplicacionesGraficas.vscode.activar =
    lib.mkEnableOption "Activa el módulo de VSCode";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.vscode.activar {
    home-manager.users.${usuario}.programs.vscode = {
      enable = true;
      profiles.default = {
        enableUpdateCheck = false;
        extensions = with pkgs.vscode-marketplace; [
          navernoedenis.gruvbox-material-icons
          biomejs.biome
          jdinhlife.gruvbox
          usernamehw.errorlens
          jnoortheen.nix-ide
          vscodevim.vim
          ms-ceintl.vscode-language-pack-es
        ];
        userSettings = {
          "editor.fontSize" = 14;
          "editor.formatOnSave" = true;
          "nix.enableLanguageServer" = true;

          "workbench.colorTheme" = "Gruvbox Dark Hard";

          "workbench.iconTheme" = "gruvbox-material-icons";
          "gruvbox-material-icons.folders.theme" = "colorful";
        };
      };
    };
  };
}
