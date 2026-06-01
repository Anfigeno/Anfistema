{ pkgs, ... }:
{
  dependencias = with pkgs; [
    fd
    fzf
    bat
  ];
  paquete = {
    name = "fzf-fish";
    src = pkgs.fetchFromGitHub {
      owner = "PatrickF1";
      repo = "fzf.fish";
      rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
      sha256 = "T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
    };
  };
  configuracion = ''
    set -Ux FZF_DEFAULT_OPTS '--preview-window=60% --layout=reverse --height=90%'
  '';
}
