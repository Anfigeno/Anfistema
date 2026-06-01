{ pkgs, ... }:
{
  paquete = {
    name = "tide";
    src = pkgs.fetchFromGitHub {
      owner = "IlanCosman";
      repo = "tide";
      rev = "fcda500d2c2996e25456fb46cd1a5532b3157b16";
      sha256 = "sha256-dzYEYC1bYP0rWpmz0fmBFwskxWYuKBMTssMELXXz5H0=";
    };
  };
}
