{ lib, ... }:
let
  motoresDeBusqueda = import ./motores { inherit lib; };
in
{
  engines = motoresDeBusqueda;
  default = motoresDeBusqueda.google.name |> lib.toLower;
  force = true;
}
