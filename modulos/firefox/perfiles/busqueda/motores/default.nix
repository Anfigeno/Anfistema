{ lib, ... }:
[
  ./google.nix
  ./youtube.nix
  ./googleAi.nix
  ./nixosSearch.nix
  ./homeManagerSearch.nix
]
|> map (ruta: import ruta)
|> map (motor: {
  name = motor.name |> lib.toLower;
  value = motor // {
    definedAliases = [ "@${motor.name |> lib.toLower}" ];
  };
})
|> lib.listToAttrs
