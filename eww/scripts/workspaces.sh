#!/usr/bin/env bash
# Workspaces para Hyprland -> Eww JSON
# Devuelve una lista con 10 workspaces y marca el activo

# Intenta obtener el workspace activo
active=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id' 2>/dev/null)

# Si hyprctl falla o no devuelve nada, forzamos 1
if [[ -z "$active" || "$active" == "null" ]]; then
  active=1
fi

# Devuelve 10 workspaces en formato JSON
jq -n --argjson cur "$active" '[range(1; 11) | {id: ., active: (. == $cur)}]'
