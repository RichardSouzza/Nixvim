{ lib }:

{
  multipleKm = mapping: map (key: mapping // { inherit key; }) (lib.toList mapping.key);
}
