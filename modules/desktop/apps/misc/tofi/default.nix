{
  inputs,
  pkgs,
  ...
}: let
  tofi-calc = pkgs.writeShellApplication {
    name = "tofi-calc";
    runtimeInputs = with pkgs; [
      wl-clipboard
      libnotify
      libqalculate
    ];
    text = ''
      RESULT_FILE="$HOME/.config/qalculate/qalc.result.history"
      mkdir -p "$(dirname "$RESULT_FILE")"
      touch "$RESULT_FILE"

      TOFI_EXP=$(tac "$RESULT_FILE" | head -1000 | tofi --prompt "Calc: " --require-match=false)
      RESULT=$(qalc -t "$TOFI_EXP")

      wl-copy "$RESULT"
      notify-send "$RESULT" "Result copied"
    '';
  };
in {
  environment.systemPackages = [
    tofi-calc
    inputs.tofi.packages.x86_64-linux.default
  ];
}
