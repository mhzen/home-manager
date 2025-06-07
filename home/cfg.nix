{
  lib,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "ghostty/config".text = ''
      # https://ghostty.org/docs/config/reference
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 14
      command = ${lib.getExe pkgs.fish}
      theme = gruvbox-material
      maximize = true
    '';
    "Code/User/settings.json".text = ''
      {
        "window.titleBarStyle": "custom",
        "editor.fontFamily": "'Cascadia Code', 'Droid Sans Mono', 'monospace', monospace, 'Symbols Nerd Font Mono'",
        "update.mode": "none",
        "workbench.startupEditor": "none",
        "telemetry.telemetryLevel": "off",
        "telemetry.feedback.enabled": false
      }
    '';
  };
}
